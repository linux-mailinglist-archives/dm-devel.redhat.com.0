Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E0EC5363C3A
	for <lists+dm-devel@lfdr.de>; Mon, 19 Apr 2021 09:10:30 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-o-9jHDEHP62hBHwBcknKhA-1; Mon, 19 Apr 2021 03:10:27 -0400
X-MC-Unique: o-9jHDEHP62hBHwBcknKhA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80D34192203D;
	Mon, 19 Apr 2021 07:10:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B0C945D9CD;
	Mon, 19 Apr 2021 07:10:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5478F44A58;
	Mon, 19 Apr 2021 07:10:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13J7AFUH016241 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 19 Apr 2021 03:10:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CF45F2166B2F; Mon, 19 Apr 2021 07:10:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C98D52182DE7
	for <dm-devel@redhat.com>; Mon, 19 Apr 2021 07:10:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F4A68001A6
	for <dm-devel@redhat.com>; Mon, 19 Apr 2021 07:10:13 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-147-AvSygczhO3Wb78IxqSEZ5A-1;
	Mon, 19 Apr 2021 03:10:07 -0400
X-MC-Unique: AvSygczhO3Wb78IxqSEZ5A-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id EFB8067373; Mon, 19 Apr 2021 09:10:04 +0200 (CEST)
Date: Mon, 19 Apr 2021 09:10:04 +0200
From: Christoph Hellwig <hch@lst.de>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <20210419071004.GA19600@lst.de>
References: <20210417023323.852530-1-damien.lemoal@wdc.com>
	<20210417023323.852530-4-damien.lemoal@wdc.com>
	<20210419064529.GA19041@lst.de>
	<BL0PR04MB651477B7ECC57FA61E1C99EFE7499@BL0PR04MB6514.namprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BL0PR04MB651477B7ECC57FA61E1C99EFE7499@BL0PR04MB6514.namprd04.prod.outlook.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	Mike Snitzer <snitzer@redhat.com>,
	Johannes Thumshirn <Johannes.Thumshirn@wdc.com>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	Christoph Hellwig <hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Apr 19, 2021 at 07:08:46AM +0000, Damien Le Moal wrote:
> 1) refuse to mount if ZA is disabled, same as btrfs

Yes, please do that.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

