Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 35EAFF4F27
	for <lists+dm-devel@lfdr.de>; Fri,  8 Nov 2019 16:17:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573226218;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=aqVVOrNSMH2ZBnKD3jQfSZ37QzRPG0krnGu9LD5EwrA=;
	b=ZPjE3xVdomz2sGQYaMCV+O0a/IuT66gsr4aJp9zlAhl3pELcDdIgfQElh27iLh0BAFaps1
	45ywrOgLsDiZbOowmeBG7XHPyzE01ul2KVAPfRRRfAOeMSmbQNCFIpF+f3PB0a97qDp62Q
	T1l30BXXoh77BnIoIN1aDuCxLxjl34g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-p4aTXvLKPEKnw-yI8KEkng-1; Fri, 08 Nov 2019 10:16:56 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34D948017DD;
	Fri,  8 Nov 2019 15:16:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 270A01A8D8;
	Fri,  8 Nov 2019 15:16:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7666118034EA;
	Fri,  8 Nov 2019 15:16:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA8FGKRD012129 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 8 Nov 2019 10:16:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D92CC5DA83; Fri,  8 Nov 2019 15:16:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B27485DA7F;
	Fri,  8 Nov 2019 15:16:17 +0000 (UTC)
Date: Fri, 8 Nov 2019 10:16:16 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Damien Le Moal <damien.lemoal@wdc.com>
Message-ID: <20191108151616.GA8047@redhat.com>
References: <20191108015702.233102-1-damien.lemoal@wdc.com>
	<20191108015702.233102-10-damien.lemoal@wdc.com>
MIME-Version: 1.0
In-Reply-To: <20191108015702.233102-10-damien.lemoal@wdc.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-scsi@vger.kernel.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Chao Yu <yuchao0@huawei.com>, linux-f2fs-devel@lists.sourceforge.net,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Jaegeuk Kim <jaegeuk@kernel.org>
Subject: Re: [dm-devel] [PATCH 9/9] block: rework zone reporting
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: p4aTXvLKPEKnw-yI8KEkng-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thu, Nov 07 2019 at  8:57pm -0500,
Damien Le Moal <damien.lemoal@wdc.com> wrote:

> From: Christoph Hellwig <hch@lst.de>
>=20
> Avoid the need to allocate a potentially large array of struct blk_zone
> in the block layer by switching the ->report_zones method interface to
> a callback model. Now the caller simply supplies a callback that is
> executed on each reported zone, and private data for it.
>=20
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>

Reviewed-by: Mike Snitzer <snitzer@redhat.com>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

