Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DA875CB14
	for <lists+dm-devel@lfdr.de>; Fri, 21 Jul 2023 17:11:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689952275;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=61Q16lDutwszhZSJRhRZt9TzMvykNLwJXm9+RZo4u5A=;
	b=FkXwoPBCv5d1Bm8wphOm3BOsw7QQTyOs5kDwFMbGCC4HV7GjyFuE1LikeUiywz81BNRtuv
	+Gj3iEcDnR3Z9h0fYnTpAFtbdp9STwg36q/Fc8LtiqoFYO/iuEN9H18AHvkjFJ8rWxcnz2
	WNC0TPUi67oTV1pItmJMMyM+I9nJbF0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-XolHFBcwNXiCwvp49oXUEQ-1; Fri, 21 Jul 2023 11:11:13 -0400
X-MC-Unique: XolHFBcwNXiCwvp49oXUEQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A92868F1848;
	Fri, 21 Jul 2023 15:11:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2CB1A2166B25;
	Fri, 21 Jul 2023 15:11:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CB87C1946A74;
	Fri, 21 Jul 2023 15:11:00 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B18601946586
 for <dm-devel@listman.corp.redhat.com>; Fri, 21 Jul 2023 15:10:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 923C62166B27; Fri, 21 Jul 2023 15:10:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file1-rdu.file-001.prod.rdu2.dc.redhat.com (unknown
 [10.11.5.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E15F2166B25;
 Fri, 21 Jul 2023 15:10:58 +0000 (UTC)
Received: by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix,
 from userid 12668)
 id A75C33096A42; Fri, 21 Jul 2023 15:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix) with ESMTP id
 A635C3F7CF; Fri, 21 Jul 2023 17:10:56 +0200 (CEST)
Date: Fri, 21 Jul 2023 17:10:56 +0200 (CEST)
From: Mikulas Patocka <mpatocka@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <6f0b9cbb-6752-6dd8-c184-10798533dfed@kernel.dk>
Message-ID: <67d28762-d41a-4f67-7e11-de7040bfb369@redhat.com>
References: <9933f5df-dd43-3447-dce3-f513368578@redhat.com>
 <6f0b9cbb-6752-6dd8-c184-10798533dfed@kernel.dk>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [dm-devel] [PATCH v2 0/3] brd discard patches
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
Cc: linux-block@vger.kernel.org, Chaitanya Kulkarni <chaitanyak@nvidia.com>,
 Christoph Hellwig <hch@infradead.org>, Li Nan <linan666@huaweicloud.com>,
 dm-devel@redhat.com, Zdenek Kabelac <zkabelac@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Fri, 21 Jul 2023, Jens Axboe wrote:

> On 7/21/23 7:48?AM, Mikulas Patocka wrote:
> > This is a new version of the brd discard patches.
> 
> Can you please:
> 
> 1) Ensure that your postings thread properly, it's all separate emails
>    and the patches don't nest under the cover letter parent.

I use alpine. I was testing it - and it turns out that when I delete the 
last character in the "Subject" field, it deletes the field "In-Reply-To" 
from the header. This must be some new bug/feature - it didn't do it in 
the past.

I'll try to be more careful to not make the "Subject" field empty when 
sending patches.

> 2) Include a changelog. What changed since v1?
> 
> -- 
> Jens Axboe

ChangeLog:

* Batch discarded pages into the "free_page_batch" structure and free all 
  of them with just one "call_rcu" call. In case of allocation failure, 
  fall back to per-page "call_rcu" calls. (suggested by Christoph Hellwig)

* Make the module parameter "/sys/module/brd/parameters/discard"  
  changeable at runtime. Changing it will iterate over all ramdisk devices 
  and call brd_set_discard_limits on them to enable or disable discard.
  (suggested by Christoph Hellwig)

* Use "switch (bio_op(bio))" in brd_submit_bio, so that the code looks 
  better. (suggested by Chaitanya Kulkarni)

* do "bio->bi_status = BLK_STS_NOTSUPP" in brd_submit_bio if unknown type 
  of bio is received.

Mikulas
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

