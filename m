Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id B3AB130A778
	for <lists+dm-devel@lfdr.de>; Mon,  1 Feb 2021 13:22:40 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-k6yXUnKoNoSobd24Wp701g-1; Mon, 01 Feb 2021 07:22:37 -0500
X-MC-Unique: k6yXUnKoNoSobd24Wp701g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B28710054FF;
	Mon,  1 Feb 2021 12:22:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CF6C60D52;
	Mon,  1 Feb 2021 12:22:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B16401809C9F;
	Mon,  1 Feb 2021 12:22:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 111CMDJP012499 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 1 Feb 2021 07:22:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4C61A637A0; Mon,  1 Feb 2021 12:22:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47B1C42ADC
	for <dm-devel@redhat.com>; Mon,  1 Feb 2021 12:22:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B2762101A562
	for <dm-devel@redhat.com>; Mon,  1 Feb 2021 12:22:10 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-119-uQdWAnePOnaUqF7GpNi2Qw-1;
	Mon, 01 Feb 2021 07:22:08 -0500
X-MC-Unique: uQdWAnePOnaUqF7GpNi2Qw-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id CCB7C6736F; Mon,  1 Feb 2021 13:22:04 +0100 (CET)
Date: Mon, 1 Feb 2021 13:22:04 +0100
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20210201122204.GA22727@lst.de>
References: <20210126145247.1964410-1-hch@lst.de>
	<20210126145247.1964410-5-hch@lst.de>
	<20210130035646.GH308988@casper.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20210130035646.GH308988@casper.infradead.org>
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
Cc: Mike Snitzer <snitzer@redhat.com>, Song Liu <song@kernel.org>,
	dm-devel@redhat.com, Christoph Hellwig <hch@lst.de>,
	Naohiro Aota <naohiro.aota@wdc.com>, linux-nilfs@vger.kernel.org,
	Chao Yu <chao@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
	Coly Li <colyli@suse.de>, linux-raid@vger.kernel.org,
	linux-bcache@vger.kernel.org, David Sterba <dsterba@suse.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@tron.linbit.com, Jaegeuk Kim <jaegeuk@kernel.org>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	Damien Le Moal <damien.lemoal@wdc.com>, linux-mm@kvack.org,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-nfs@vger.kernel.org, linux-btrfs@vger.kernel.org
Subject: Re: [dm-devel] [PATCH 04/17] block: split bio_kmalloc from
	bio_alloc_bioset
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jan 30, 2021 at 03:56:46AM +0000, Matthew Wilcox wrote:
> On Tue, Jan 26, 2021 at 03:52:34PM +0100, Christoph Hellwig wrote:
> > bio_kmalloc shares almost no logic with the bio_set based fast path
> > in bio_alloc_bioset.  Split it into an entirely separate implementation.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > ---
> >  block/bio.c         | 167 ++++++++++++++++++++++----------------------
> >  include/linux/bio.h |   6 +-
> >  2 files changed, 86 insertions(+), 87 deletions(-)
> 
> This patch causes current linux-next to OOM for me when running xfstests
> after about ten minutes.  Haven't looked into why yet, this is just the
> results of a git bisect.

I've run tests on linux-next all weekend and could not reproduce
the issue.  Can you share your .config?

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

