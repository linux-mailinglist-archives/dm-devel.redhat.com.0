Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BADD4A64FB
	for <lists+dm-devel@lfdr.de>; Tue,  1 Feb 2022 20:26:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643743592;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VQpTMemC7sAbBu7TWCx21JTyUulX1qw74xNnFC+OOSs=;
	b=V/Aq6fepxb2Bv0wnF2fMRF2eLniLAin7Mvr1CYebOUzZZIwrNPtI8eAkMA8OM231ht4J1n
	c58FMEwlrbwGuoz5f1RplQe/em5Eyr+JsLZ1GzVZ+FY5oh2dalVsa6o2I+YFLXx5c+3v24
	0+7Zxa3Sf+Gef8WOWpJK53uskP3AxL4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-287-IOQN-TIdMui4vyJtKsmjfg-1; Tue, 01 Feb 2022 14:26:29 -0500
X-MC-Unique: IOQN-TIdMui4vyJtKsmjfg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 972491091DA3;
	Tue,  1 Feb 2022 19:26:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C1965D6BA;
	Tue,  1 Feb 2022 19:26:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2BA111809CB9;
	Tue,  1 Feb 2022 19:26:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 211JQCF5007992 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 1 Feb 2022 14:26:12 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 03D735F4F4; Tue,  1 Feb 2022 19:26:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 73DEA5D6BA;
	Tue,  1 Feb 2022 19:25:59 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 211JPwaE023932; Tue, 1 Feb 2022 14:25:58 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 211JPwim023928; Tue, 1 Feb 2022 14:25:58 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Tue, 1 Feb 2022 14:25:58 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <1380d0e4-032d-133b-4ebb-f10d85e39800@acm.org>
Message-ID: <alpine.LRH.2.02.2202011421320.21843@file01.intranet.prod.int.rdu2.redhat.com>
References: <f0e19ae4-b37a-e9a3-2be7-a5afb334a5c3@nvidia.com>
	<20220201102122.4okwj2gipjbvuyux@mpHalley-2>
	<alpine.LRH.2.02.2202011327350.22481@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2202011332330.22481@file01.intranet.prod.int.rdu2.redhat.com>
	<1380d0e4-032d-133b-4ebb-f10d85e39800@acm.org>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Chaitanya Kulkarni <chaitanyak@nvidia.com>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>
Subject: Re: [dm-devel] [RFC PATCH 2/3] nvme: add copy offload support
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Tue, 1 Feb 2022, Bart Van Assche wrote:

> On 2/1/22 10:33, Mikulas Patocka wrote:
> > +static inline blk_status_t nvme_setup_read_token(struct nvme_ns *ns, struct
> > request *req)
> > +{
> > +	struct bio *bio = req->bio;
> > +	struct nvme_copy_token *token =
> > page_to_virt(bio->bi_io_vec[0].bv_page) + bio->bi_io_vec[0].bv_offset;
> 
> Hmm ... shouldn't this function use bvec_kmap_local() instead of
> page_to_virt()?
> 
> Thanks,
> 
> Bart.

.bv_page is allocated only in blkdev_issue_copy with alloc_page. So, 
page_to_virt works.

But you are right that bvec_kmap_local may be nicer.

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

