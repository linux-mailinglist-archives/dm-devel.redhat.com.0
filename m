Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 5405820ED30
	for <lists+dm-devel@lfdr.de>; Tue, 30 Jun 2020 07:11:09 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-WJtjIUrpNUCrPy8mAp5bZg-1; Tue, 30 Jun 2020 01:11:05 -0400
X-MC-Unique: WJtjIUrpNUCrPy8mAp5bZg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E253A800D5C;
	Tue, 30 Jun 2020 05:10:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA30B5C220;
	Tue, 30 Jun 2020 05:10:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3835C1809547;
	Tue, 30 Jun 2020 05:10:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05U5ArOV026098 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 30 Jun 2020 01:10:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F0782115DB7; Tue, 30 Jun 2020 05:10:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EC295115DA7
	for <dm-devel@redhat.com>; Tue, 30 Jun 2020 05:10:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D9ED9100CF85
	for <dm-devel@redhat.com>; Tue, 30 Jun 2020 05:10:50 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-314-Rme6Bo7fO8C6IXGQgjH-sQ-1;
	Tue, 30 Jun 2020 01:10:45 -0400
X-MC-Unique: Rme6Bo7fO8C6IXGQgjH-sQ-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id E934C6736F; Tue, 30 Jun 2020 07:10:42 +0200 (CEST)
Date: Tue, 30 Jun 2020 07:10:42 +0200
From: Christoph Hellwig <hch@lst.de>
To: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Message-ID: <20200630051042.GB27033@lst.de>
References: <20200629234314.10509-1-chaitanya.kulkarni@wdc.com>
	<20200629234314.10509-3-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
In-Reply-To: <20200629234314.10509-3-chaitanya.kulkarni@wdc.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, paolo.valente@linaro.org, sagi@grimberg.me,
	snitzer@redhat.com, fangguoju@gmail.com, rdunlap@infradead.org,
	rostedt@goodmis.org, ming.lei@redhat.com,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	mingo@redhat.com, colyli@suse.de, jack@suse.czi, hch@lst.de,
	agk@redhat.com, bvanassche@acm.org
Subject: Re: [dm-devel] [PATCH 02/11] block: rename block_bio_merge class to
	block_bio
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Jun 29, 2020 at 04:43:05PM -0700, Chaitanya Kulkarni wrote:
> There are identical TRACE_EVENTS presents which can now take an
> advantage of the block_bio_merge trace event class.
> 
> This is a prep patch which renames block_bio_merge to block_bio so
> that the next patches in this series will be able to resue it.

The changes look good, but I'd merged it with the patches adding
actual new users (which also look good to me).

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

