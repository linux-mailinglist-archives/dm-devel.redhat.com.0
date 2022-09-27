Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C09F85EC5A0
	for <lists+dm-devel@lfdr.de>; Tue, 27 Sep 2022 16:12:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664287955;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=mN7qhKPP9bUi4gfRj49NujoPWrlyXboYFiTE6jX1uWA=;
	b=OQTrufMWMFxDZkyVjeYQeb6iLMmTwMtbjSw9O44/rLZzccAnjFI3aQ2wJ30xWaQC5ftPTb
	YdVZcFxBoW6bx1n1tm2wl2Cux9WiSpVPMj+lTttig1GC40dkc5OeehqmktqK3Wsa+s9bqQ
	/PKwWbeNN6fxz8WFXglYZdo+l2p7sUM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-IfjbgYqdPtCVYZg2QuCLGg-1; Tue, 27 Sep 2022 10:12:32 -0400
X-MC-Unique: IfjbgYqdPtCVYZg2QuCLGg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA19387B2AE;
	Tue, 27 Sep 2022 14:12:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 30FDF2166B2B;
	Tue, 27 Sep 2022 14:12:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8160C1946A4E;
	Tue, 27 Sep 2022 14:12:28 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C327B19465B1
 for <dm-devel@listman.corp.redhat.com>; Tue, 27 Sep 2022 14:12:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 97C7D1121315; Tue, 27 Sep 2022 14:12:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
 (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 36C701121314;
 Tue, 27 Sep 2022 14:12:26 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id
 28RECQDi029906; Tue, 27 Sep 2022 10:12:26 -0400
Received: from localhost (mpatocka@localhost)
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP
 id 28RECQCu029902; Tue, 27 Sep 2022 10:12:26 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
 owned process doing -bs
Date: Tue, 27 Sep 2022 10:12:26 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: "Pra.. Dew.." <linux_learner@outlook.com>
In-Reply-To: <BY5PR14MB3893F484853A8B896555EE03864D9@BY5PR14MB3893.namprd14.prod.outlook.com>
Message-ID: <alpine.LRH.2.02.2209271009270.28431@file01.intranet.prod.int.rdu2.redhat.com>
References: <BY5PR14MB389354D6BB8D1161E57B3FEA864B9@BY5PR14MB3893.namprd14.prod.outlook.com>
 <alpine.LRH.2.02.2209180604190.19406@file01.intranet.prod.int.rdu2.redhat.com>
 <BY5PR14MB3893F484853A8B896555EE03864D9@BY5PR14MB3893.namprd14.prod.outlook.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [dm-devel] dm-verity with GPT
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
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: MULTIPART/MIXED; BOUNDARY="185206533-143823404-1664287946=:28431"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
--185206533-143823404-1664287946=:28431
Content-Type: TEXT/PLAIN; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT



On Mon, 19 Sep 2022, Pra.. Dew.. wrote:

> 
> Thank you Mikulas. I just want to make sure I understand what you are 
> saying. Currently we making a dm-linear, dm-verity, dm-linear target; if 
> I understand you right you are suggesting to make it a dm-veriy, 
> dm-linear, dm-linear target? Of course the 2nd dm-linear target will 
> have LBAs before dm-verity target. Did I get this right?

I mean this: create a first dm device with only the dm-verity target in 
the table.

Then, create a second dm device that has only the dm-linear target that 
points to the first device in the table.

Then, create a third device that has three linear devices in the table - a 
GPT beginning, a second dm device, and a GPT end.

Mikulas


> Hi
> 
> I think that you can create dm-verity target, put dm-linear on the top of
> it and insert that dm-linear into the table with the other two dm-linear
> targets.
> 
> Would it work this way?
> 
> Mikulas
> 
>  
> 
> 
> 
--185206533-143823404-1664287946=:28431
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

--185206533-143823404-1664287946=:28431--

