Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id BF38E5B493
	for <lists+dm-devel@lfdr.de>; Mon,  1 Jul 2019 08:19:40 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1A0C7308624A;
	Mon,  1 Jul 2019 06:19:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D35B5C207;
	Mon,  1 Jul 2019 06:19:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 011241833002;
	Mon,  1 Jul 2019 06:18:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x616H82A026981 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 1 Jul 2019 02:17:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6C749648D0; Mon,  1 Jul 2019 06:17:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1AFA56A97D;
	Mon,  1 Jul 2019 06:17:03 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 687E283F44;
	Mon,  1 Jul 2019 06:16:34 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 26E4F68B20; Mon,  1 Jul 2019 08:16:32 +0200 (CEST)
Date: Mon, 1 Jul 2019 08:16:31 +0200
From: Christoph Hellwig <hch@lst.de>
To: Damien Le Moal <damien.lemoal@wdc.com>
Message-ID: <20190701061631.GA20073@lst.de>
References: <20190701050918.27511-1-damien.lemoal@wdc.com>
	<20190701050918.27511-2-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190701050918.27511-2-damien.lemoal@wdc.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.27]); Mon, 01 Jul 2019 06:16:56 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Mon, 01 Jul 2019 06:16:56 +0000 (UTC) for IP:'213.95.11.211'
	DOMAIN:'verein.lst.de' HELO:'verein.lst.de' FROM:'hch@lst.de'
	RCPT:''
X-RedHat-Spam-Score: -0.008  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_NONE) 213.95.11.211 verein.lst.de 213.95.11.211
	verein.lst.de <hch@lst.de>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Mike Snitzer <snitzer@redhat.com>, linux-f2fs-devel@lists.sourceforge.net,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	linux-scsi@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
	Christoph Hellwig <hch@lst.de>, Bart Van Assche <bvanassche@acm.org>
Subject: Re: [dm-devel] [PATCH V6 1/4] block: Allow mapping of vmalloc-ed
	buffers
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Mon, 01 Jul 2019 06:19:34 +0000 (UTC)

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
