Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 59D6D364219
	for <lists+dm-devel@lfdr.de>; Mon, 19 Apr 2021 14:56:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618836963;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=S3ua6xbYW+Zgbjids1ZkG+TNxON7tBilFS81KkVcuc4=;
	b=cUE/H0G5kaXZR89d+wyTN4HPAnpVvWsnagkI/yeyC1J5CkACZypWxO7hQhA64EuJ4k5XXA
	4xlmV/KDXGWGmUHQbRGGdMIR70+oOZBIQu+e8wap/mZ7XqoEH8ArQtMGvkAVhQQndtixe2
	soGX4nhTZwD+Mnr//3l0jFhEW32iHo8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-8IlsaDMtNcKsVhWklCPVIA-1; Mon, 19 Apr 2021 08:56:01 -0400
X-MC-Unique: 8IlsaDMtNcKsVhWklCPVIA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28A3619611B4;
	Mon, 19 Apr 2021 12:55:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 18881E730;
	Mon, 19 Apr 2021 12:55:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A6F7A1806D19;
	Mon, 19 Apr 2021 12:55:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13JCqdxH022426 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 19 Apr 2021 08:52:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C63361001B2C; Mon, 19 Apr 2021 12:52:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0717A10016F4;
	Mon, 19 Apr 2021 12:52:32 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 13JCqW6V010975; Mon, 19 Apr 2021 08:52:32 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 13JCqVuW010967; Mon, 19 Apr 2021 08:52:31 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Mon, 19 Apr 2021 08:52:31 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Damien Le Moal <damien.lemoal@wdc.com>
In-Reply-To: <20210417023323.852530-1-damien.lemoal@wdc.com>
Message-ID: <alpine.LRH.2.02.2104190840310.9677@file01.intranet.prod.int.rdu2.redhat.com>
References: <20210417023323.852530-1-damien.lemoal@wdc.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-scsi@vger.kernel.org,
	Mike Snitzer <snitzer@redhat.com>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	linux-nvme@lists.infradead.org, linux-block@vger.kernel.org,
	Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>, dm-devel@redhat.com,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [PATCH v2 0/3] Fix dm-crypt zoned block device
 support
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Sat, 17 Apr 2021, Damien Le Moal wrote:

> Mike,
> 
> Zone append BIOs (REQ_OP_ZONE_APPEND) always specify the start sector
> of the zone to be written instead of the actual location sector to
> write. The write location is determined by the device and returned to
> the host upon completion of the operation.

I'd like to ask what's the reason for this semantics? Why can't users of 
the zoned device supply real sector numbers?

> This interface, while simple and efficient for writing into sequential
> zones of a zoned block device, is incompatible with the use of sector
> values to calculate a cypher block IV. All data written in a zone is
> encrypted using an IV calculated from the first sectors of the zone,
> but read operation will specify any sector within the zone, resulting
> in an IV mismatch between encryption and decryption. Reads fail in that
> case.

I would say that it is incompatible with all dm targets - even the linear 
target is changing the sector number and so it may redirect the write 
outside of the range specified in dm-table and cause corruption.

Instead of complicating device mapper with imperfect support, I would just 
disable REQ_OP_ZONE_APPEND on device mapper at all.

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

