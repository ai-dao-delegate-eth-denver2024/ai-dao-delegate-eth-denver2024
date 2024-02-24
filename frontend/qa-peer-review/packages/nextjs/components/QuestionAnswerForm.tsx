// components/QuestionAnswerForm.tsx
import { useState } from "react";
import {
  Box,
  Button,
  Flex,
  FormControl,
  FormLabel,
  Input,
  Textarea, // Import the TextArea component
} from "@chakra-ui/react";

interface QuestionAnswerFormProps {
  onSubmit: (question: string, answer: string) => void;
}

const QuestionAnswerForm: React.FC<QuestionAnswerFormProps> = ({ onSubmit }) => {
  const [question, setQuestion] = useState("");
  const [answer, setAnswer] = useState("");

  const handleFormSubmit = () => {
    // You can perform any additional logic here before submitting
    onSubmit(question, answer);
  };

  return (
    <Flex direction="column" alignItems="stretch" justifyContent="stretch" bg="gray.100" w="80vw" h="80vh">
      <Box p={4} bg="white" rounded="md" shadow="md"  display="flex" flexDirection="column" justifyContent="center" alignItems="stretch">
        <FormControl>
          <FormLabel>Question</FormLabel>
          <Input
            type="text"
            placeholder="Enter your question"
            value={question}
            onChange={e => setQuestion(e.target.value)}
          />
        </FormControl>
        <FormControl mt={4}>
          <FormLabel>Answer</FormLabel>
          {/* Replace Input with TextArea */}
          <Textarea
            placeholder="Enter your answer"
            value={answer}
            onChange={e => setAnswer(e.target.value)}
            resize="vertical" // Allow vertical resizing
            rows={5} // Set the default height to approximately 5 lines
          />
        </FormControl>
        <Button mt={4} backgroundColor="teal" colorScheme="teal" onClick={handleFormSubmit}>
          Submit for Review
        </Button>
      </Box>
    </Flex>
  );
};

export default QuestionAnswerForm;
