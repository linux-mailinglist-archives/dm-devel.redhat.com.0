Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 212D574D9D8
	for <lists+dm-devel@lfdr.de>; Mon, 10 Jul 2023 17:25:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689002699;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2HIMn9XKXBjBnEPTXKSlWEZha0EF8pSn80kB21KDtrw=;
	b=LCdDfAKXpy4+SohfBWIQMhQU24dxZ61AXSdEewuWmH9SBE6shWlh1vjRnAMzmky1bYJJ8d
	idUdAnooajA5cYPToLe5EMKQrOHMMVlKpld1Py5ODRTGmrfeyuZT1dlVCDFRauiu8BF96L
	XrRC5nVWzNnLWYxpUTa/6cV5lr6I9L8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-6zZ_dcl2N-Smf9t5IyLkIw-1; Mon, 10 Jul 2023 11:24:57 -0400
X-MC-Unique: 6zZ_dcl2N-Smf9t5IyLkIw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C04B229AA2ED;
	Mon, 10 Jul 2023 15:24:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D931B492C13;
	Mon, 10 Jul 2023 15:24:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 923CC19451E4;
	Mon, 10 Jul 2023 15:24:49 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 795E019451D3
 for <dm-devel@listman.corp.redhat.com>; Mon, 10 Jul 2023 15:24:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 10ED540C2071; Mon, 10 Jul 2023 15:24:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file1-rdu.file-001.prod.rdu2.dc.redhat.com (unknown
 [10.11.5.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EE84640C206F;
 Mon, 10 Jul 2023 15:24:45 +0000 (UTC)
Received: by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix,
 from userid 12668)
 id DC73F30C0457; Mon, 10 Jul 2023 15:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix) with ESMTP id
 D83C03FB76; Mon, 10 Jul 2023 17:24:45 +0200 (CEST)
Date: Mon, 10 Jul 2023 17:24:45 +0200 (CEST)
From: Mikulas Patocka <mpatocka@redhat.com>
To: Li Nan <linan666@huaweicloud.com>, Jens Axboe <axboe@kernel.dk>
In-Reply-To: <ace0451f-b979-be13-cf47-a8cb3656c72e@huaweicloud.com>
Message-ID: <4b6788d2-c6e1-948-22d-dbb7cbba657d@redhat.com>
References: <alpine.LRH.2.02.2209201350470.26058@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2209201358120.26535@file01.intranet.prod.int.rdu2.redhat.com>
 <ace0451f-b979-be13-cf47-a8cb3656c72e@huaweicloud.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [dm-devel] [PATCH v2 3/4] brd: enable discard
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
Cc: Christoph Hellwig <hch@infradead.org>, linux-block@vger.kernel.org,
 dm-devel@redhat.com, Zdenek Kabelac <zkabelac@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Mon, 10 Jul 2023, Li Nan wrote:

> Hi, Mikulas
> 
> The lack of discard in ramdisk can cause some issues related to dm. see:
> https://lore.kernel.org/all/20220228141354.1091687-1-luomeng12@huawei.com/
> 
> I noticed that your patch series has already supported discard for brd. But
> this patch series has not been applied to mainline at present, may I ask if
> you still plan to continue working on it?
> 
> -- 
> Thanks,
> Nan

Hi

I got no response from ramdisk maintainer Jens Axboe. We should ask him, 
whether he doesn't want discard on ramdisk at all or whether he wants it.

Mikulas
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

