Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9095BBD61
	for <lists+dm-devel@lfdr.de>; Sun, 18 Sep 2022 12:11:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663495862;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JLeGWJOjcSK2qgDPHfE221CziAlqq/e1L38FrAhSDII=;
	b=atRHtRWag4KHYfohFNBf97wM6mBEHcShPnCCEkv418sUHaXS2wKLE/p//EagIbF3nAvYkT
	RKv9EhpT3TrHvC9lLw9PocT/LithQZeIlwTAMcQFfgGvTSRar7+XlQ6Iykaz68MFHlBGES
	UmCmRuO2BS9RmlIQyVIiqhpDR3+g4ns=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-183-_pVuvhS8PBOyVwXMtdO5pw-1; Sun, 18 Sep 2022 06:10:59 -0400
X-MC-Unique: _pVuvhS8PBOyVwXMtdO5pw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C656829AA3BA;
	Sun, 18 Sep 2022 10:10:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CF210C15BA4;
	Sun, 18 Sep 2022 10:10:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A3C7819465A4;
	Sun, 18 Sep 2022 10:10:49 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A35D41946586
 for <dm-devel@listman.corp.redhat.com>; Sun, 18 Sep 2022 10:10:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 94150C15BA5; Sun, 18 Sep 2022 10:10:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
 (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 872FCC15BA4;
 Sun, 18 Sep 2022 10:10:48 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id
 28IAAmpa019639; Sun, 18 Sep 2022 06:10:48 -0400
Received: from localhost (mpatocka@localhost)
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP
 id 28IAAmqA019635; Sun, 18 Sep 2022 06:10:48 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
 owned process doing -bs
Date: Sun, 18 Sep 2022 06:10:48 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: "Pra.. Dew.." <linux_learner@outlook.com>
In-Reply-To: <BY5PR14MB389354D6BB8D1161E57B3FEA864B9@BY5PR14MB3893.namprd14.prod.outlook.com>
Message-ID: <alpine.LRH.2.02.2209180604190.19406@file01.intranet.prod.int.rdu2.redhat.com>
References: <BY5PR14MB389354D6BB8D1161E57B3FEA864B9@BY5PR14MB3893.namprd14.prod.outlook.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Sat, 17 Sep 2022, Pra.. Dew.. wrote:

> 
> We have a scenario for a VM where a VM is running in the host Linux 
> using KVM. We want to expose verity protected rootfs to the VM. This 
> rootfs clearly needs to be RO. However, we also want to expose it as a 
> GPT partition. In order to do this we are attaching two small files 
> before and after the rootfs. The files use linear mapping and get mapped 
> to the same /dev/mapper/XX device that has a verity partition. These two 
> files contain the partition mappings (primary and backup) for GPT. From 
> the VMs perspective, it sees one device (/dev/mapper/xx) as a GPT device 
> with rootfs.
> 
> The challenge we are getting into is that dm-verity kernel 
> implementation explicitly prohibits mixing linear and verity mapping and 
> forces the /dev/mapper/xx device to be RO and our needs are exactly the 
> opposite.
> 
> Has anyone seen this scenario before? Any suggestions?
> 
> Thanks

Hi

I think that you can create dm-verity target, put dm-linear on the top of 
it and insert that dm-linear into the table with the other two dm-linear 
targets.

Would it work this way?

Mikulas
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

