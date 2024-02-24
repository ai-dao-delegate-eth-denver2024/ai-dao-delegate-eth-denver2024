"use client";

import { Flex } from "@chakra-ui/react";
import type { NextPage } from "next";
import QuestionAnswerForm from "~~/components/QuestionAnswerForm";

const Home: NextPage = () => {
  return (
    <>
      <Flex direction="column" align="center" justify="center" h="100vh" w="100vw" bg="gray.100">
        <QuestionAnswerForm onSubmit={(q, a) => console.log("submitted " + q + " and " + a)} />
      </Flex>
    </>
  );
};

export default Home;
