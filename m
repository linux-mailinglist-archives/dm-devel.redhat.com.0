Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBB14EC9DE
	for <lists+dm-devel@lfdr.de>; Wed, 30 Mar 2022 18:46:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1648658802;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tuxOx2tBZPFRbJQJX1Jar2N8BAATAxrJtfZBUC2JVr0=;
	b=iugiN7Y1WjAQW+5eGP2p1skj7opTiNxpBC04Qm8+exdhp/yk9Rjuy3+SxWmrr351U4FYlA
	7l5I3htDF67ZCq6YQwROvrJ8dH/DvqK9Jxo5j7KaC+t9dj4CZUKhOdcTF74f78A793rUEp
	9Cd6sY45J3XqZUkVNgV8xeux9EaUuTA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-aUAs8uToNqytTIoMviT4OA-1; Wed, 30 Mar 2022 12:46:40 -0400
X-MC-Unique: aUAs8uToNqytTIoMviT4OA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71AF78339AC;
	Wed, 30 Mar 2022 16:46:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2738440CFD0B;
	Wed, 30 Mar 2022 16:46:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 53DB31940342;
	Wed, 30 Mar 2022 16:46:00 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CC74F19451F3
 for <dm-devel@listman.corp.redhat.com>; Wed, 30 Mar 2022 16:45:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 54150112131E; Wed, 30 Mar 2022 16:45:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
 (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 62870112132D;
 Wed, 30 Mar 2022 16:45:38 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id
 22UGjYtS002792; Wed, 30 Mar 2022 12:45:35 -0400
Received: from localhost (mpatocka@localhost)
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP
 id 22UGjXFg002788; Wed, 30 Mar 2022 12:45:34 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
 owned process doing -bs
Date: Wed, 30 Mar 2022 12:45:32 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Hannes Reinecke <hare@suse.de>
In-Reply-To: <2b0b3390-ff91-d9fe-7313-2edf9b2ffebb@suse.de>
Message-ID: <alpine.LRH.2.02.2203301214280.32126@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2203281232060.11240@file01.intranet.prod.int.rdu2.redhat.com>
 <2b0b3390-ff91-d9fe-7313-2edf9b2ffebb@suse.de>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: Re: [dm-devel] [PATCH] dm: fix race condition on Alpha
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
Cc: axboe@kernel.dk, dm-devel@redhat.com, Mike Snitzer <msnitzer@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Tue, 29 Mar 2022, Hannes Reinecke wrote:

> On 3/28/22 18:34, Mikulas Patocka wrote:
> > Early alpha processors cannot write a single byte or short; they read 8
> > bytes, modify the value in registers and write back 8 bytes.
> > 
> > This could cause race condition in the structure dm_io - if the fields
> > flags and io_count are modified simultaneously.
> > 
> > Fix this bug by using 32-bit flags if we are on Alpha and if we are
> > compiling for a processor that doesn't have the byte-word-extension.
> > 
> Errm.
> 
> Seeing that those alphas could only modify 64 bit atomically, what 
> exactly do you gain by using 32-bit flags?
> Shouldn't you be using 64-bit flags?
> 
> Cheers,
> 
> Hannes

Alpha can modify atomically aligned 32 bits or aligned 64 bits (using the 
STL or STQ instruction).

If it needs to modify 8 or 16 bits, it reads 64 bits (using the LDQ_U 
instruction), modifies the value in the register (using the INSBL and 
MSKBL instructions) and writes back 64 bits (using the STQ_U instruction).

Using 32-bit flags is safe, because it reads them and writes them directly 
using the 32-bit LDL and STL instructions.

Mikulas
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

