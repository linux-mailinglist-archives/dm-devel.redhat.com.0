Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 89EC52CCF9B
	for <lists+dm-devel@lfdr.de>; Thu,  3 Dec 2020 07:40:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1606977655;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Q4jxjS5wVE4xwFfhx09nOD6VaFnzIH49NqgEawIFtKU=;
	b=IJDhtbwVX1XkjbAimqI+nP4rLIIK0inRPD9thSmA5S961jWAhZfbKotrMuktTMIbySgAUe
	NhbnuPUCFvqFyNFHLBKUY0L38pqR6ZEhtmLLbpMnNhtFZMwhHGaBP78Y6DEToX/RNu8f/V
	evQZRIzXY6qMrlLxY7aYaorVs7In3CM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-Zptmt05dP2-p3IE1QEzlIw-1; Thu, 03 Dec 2020 01:40:53 -0500
X-MC-Unique: Zptmt05dP2-p3IE1QEzlIw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79A478030D5;
	Thu,  3 Dec 2020 06:40:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2668210016FB;
	Thu,  3 Dec 2020 06:40:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AE2681809C9F;
	Thu,  3 Dec 2020 06:40:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B36e4DZ029969 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 3 Dec 2020 01:40:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B91231D7; Thu,  3 Dec 2020 06:40:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-13-173.pek2.redhat.com [10.72.13.173])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C920C1A890;
	Thu,  3 Dec 2020 06:39:51 +0000 (UTC)
Date: Thu, 3 Dec 2020 14:39:41 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20201203063941.GA629758@T590>
References: <20201201165424.2030647-1-hch@lst.de>
	<20201201165424.2030647-4-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20201201165424.2030647-4-hch@lst.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-s390@vger.kernel.org,
	linux-bcache@vger.kernel.org, Coly Li <colyli@suse.de>,
	linux-raid@vger.kernel.org, Song Liu <song@kernel.org>,
	dm-devel@redhat.com, linux-block@vger.kernel.org, Tejun Heo <tj@kernel.org>
Subject: Re: [dm-devel] [PATCH 3/9] block: store a block_device pointer in
	struct bio
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 01, 2020 at 05:54:18PM +0100, Christoph Hellwig wrote:
> Replace the gendisk pointer in struct bio with a pointer to the newly
> improved struct block device.  From that the gendisk can be trivially
> accessed with an extra indirection, but it also allows to directly
> look up all information related to partition remapping.

The extra indirection is often done in fast path, so just wondering why
you don't consider to embed gendisk into block_device? Then the extra
indirection can be avoided.


Thanks,
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

