Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id AE5C7363BD3
	for <lists+dm-devel@lfdr.de>; Mon, 19 Apr 2021 08:46:24 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-HxYyWyUbOuu2LYY0IJfntg-1; Mon, 19 Apr 2021 02:46:21 -0400
X-MC-Unique: HxYyWyUbOuu2LYY0IJfntg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA4CC8189C7;
	Mon, 19 Apr 2021 06:46:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A6B2F100AE2C;
	Mon, 19 Apr 2021 06:46:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2E1C01806D17;
	Mon, 19 Apr 2021 06:45:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13J6jcFp013292 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 19 Apr 2021 02:45:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2F3582ED80; Mon, 19 Apr 2021 06:45:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A3B27C2C
	for <dm-devel@redhat.com>; Mon, 19 Apr 2021 06:45:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E2A6802A64
	for <dm-devel@redhat.com>; Mon, 19 Apr 2021 06:45:34 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-268-GUg3QBlqPyu-MRuE0-K-ww-1;
	Mon, 19 Apr 2021 02:45:32 -0400
X-MC-Unique: GUg3QBlqPyu-MRuE0-K-ww-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 8535E6736F; Mon, 19 Apr 2021 08:45:29 +0200 (CEST)
Date: Mon, 19 Apr 2021 08:45:29 +0200
From: Christoph Hellwig <hch@lst.de>
To: Damien Le Moal <damien.lemoal@wdc.com>
Message-ID: <20210419064529.GA19041@lst.de>
References: <20210417023323.852530-1-damien.lemoal@wdc.com>
	<20210417023323.852530-4-damien.lemoal@wdc.com>
MIME-Version: 1.0
In-Reply-To: <20210417023323.852530-4-damien.lemoal@wdc.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-scsi@vger.kernel.org,
	Mike Snitzer <snitzer@redhat.com>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	linux-nvme@lists.infradead.org, linux-block@vger.kernel.org,
	Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>, dm-devel@redhat.com,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [PATCH v2 3/3] zonefs: fix synchronous write to
 sequential zone files
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Apr 17, 2021 at 11:33:23AM +0900, Damien Le Moal wrote:
> Synchronous writes to sequential zone files cannot use zone append
> operations if the underlying zoned device queue limit
> max_zone_append_sectors is 0, indicating that the device does not
> support this operation. In this case, fall back to using regular write
> operations.

Zone append is a mandatory feature of the zoned device API.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

