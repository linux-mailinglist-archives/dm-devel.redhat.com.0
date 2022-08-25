Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D565A1257
	for <lists+dm-devel@lfdr.de>; Thu, 25 Aug 2022 15:32:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661434345;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xMtUhws6hI+amWBoS2vMy5bUSC/4/F24dfcXf8QrKJI=;
	b=fwn/l9+Y5a5qa7tdjG0P3Ta1qNmZWRSEy0np7t3lmYo2zeu+u9l/IIL+Sd0Szxz2SPgYsv
	ktCc2+vca2N8Sj8R1QnYcqVP4fYQjbvxHu0S4N6u3fhvQsXUQ0+8I97adg3dBU42JkTCNw
	EaIxCuqBjWZuVe9udzIohNOnkdMN+/0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-R0nZJDggMKmyW3YsUL8n9w-1; Thu, 25 Aug 2022 09:32:21 -0400
X-MC-Unique: R0nZJDggMKmyW3YsUL8n9w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C05B185A7BA;
	Thu, 25 Aug 2022 13:32:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6246F492CA5;
	Thu, 25 Aug 2022 13:32:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 62DC51946A6C;
	Thu, 25 Aug 2022 13:32:11 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 564E51946A43
 for <dm-devel@listman.corp.redhat.com>; Thu, 25 Aug 2022 13:32:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 39E87C15BBD; Thu, 25 Aug 2022 13:32:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
 (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 315A8C15BBA;
 Thu, 25 Aug 2022 13:32:09 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id
 27PDW92g025447; Thu, 25 Aug 2022 09:32:09 -0400
Received: from localhost (mpatocka@localhost)
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP
 id 27PDW9gU025443; Thu, 25 Aug 2022 09:32:09 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
 owned process doing -bs
Date: Thu, 25 Aug 2022 09:32:09 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <790dbd9d-bc22-9814-2823-8882a95ec57c@gmail.com>
Message-ID: <alpine.LRH.2.02.2208250909450.22325@file01.intranet.prod.int.rdu2.redhat.com>
References: <120284F5-514F-4EA0-A0AE-8B759FF78931@suse.de>
 <alpine.LRH.2.02.2208241530300.1585@file01.intranet.prod.int.rdu2.redhat.com>
 <790dbd9d-bc22-9814-2823-8882a95ec57c@gmail.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: Re: [dm-devel] A kernel panic (or soft lockup) due to stack
 overflow by recursive dm-table reload
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: dm-devel@redhat.com, Alasdair G Kergon <agk@redhat.com>,
 Coly Li <colyli@suse.de>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Thu, 25 Aug 2022, Zdenek Kabelac wrote:

> Since reproducing this issue is rather 'trival' - since creation of simple 
> linear DM device and reloading it with 'self-reference' table line is easy I'd 
> advocate for some simplistic check on kernel side - as such 'crash' can't be 
> even rebooted with SysRQ+B (on my laptop).
> 
> I guess some 'bitmap/tree' of already visited device during some check might 
> avoid endless loop although it's quite 'ugly' this check needs to happen on 
> 'resume' phase - so the failure here is hard to deal with - still better than 
> this kernel busy loop.
> 
> Zdenek

Detecting dm table self-reference is easy, but detecting a loop in the 
dependency graph is complicated and I would't do it.

There is another (more serious) problem - the user can crash the kernel by 
creating deep-enough non-recursive mapping. We do not specify any maximum 
tree depth that is guaranteed to work. Perhaps we should specify such 
depth and audit the code so that this maximum device depth doesn't 
overflow the stack.

Perhaps we could add a function remaining_stack_space() and just bail out 
of recursion when it returns too low value. But the problem with this 
approach is that different architectures have different stack consumption 
(for example, on sparc64, every non-leaf function consumes at least 176 
bytes of stack). Perhaps we could bail out if less than X percent of the 
stack is remaining.

Mikulas
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

