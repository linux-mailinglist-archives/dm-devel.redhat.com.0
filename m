Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id D2EC62103CB
	for <lists+dm-devel@lfdr.de>; Wed,  1 Jul 2020 08:19:27 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-9KSYzCiwOXaW0nM-yfnqUA-1; Wed, 01 Jul 2020 02:19:22 -0400
X-MC-Unique: 9KSYzCiwOXaW0nM-yfnqUA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D7ABA0C04;
	Wed,  1 Jul 2020 06:19:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 951038ACE8;
	Wed,  1 Jul 2020 06:19:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4E8091809543;
	Wed,  1 Jul 2020 06:19:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0616J875017230 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 1 Jul 2020 02:19:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7BEF62166BA2; Wed,  1 Jul 2020 06:19:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6397A2144B34
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 06:19:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 920918EF3A5
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 06:19:05 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-487-U6ms7dzyPd2fzzCx57AI9g-1;
	Wed, 01 Jul 2020 02:19:02 -0400
X-MC-Unique: U6ms7dzyPd2fzzCx57AI9g-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 1AC9A68B02; Wed,  1 Jul 2020 08:18:59 +0200 (CEST)
Date: Wed, 1 Jul 2020 08:18:58 +0200
From: Christoph Hellwig <hch@lst.de>
To: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
Message-ID: <20200701061858.GB28483@lst.de>
References: <20200629234314.10509-1-chaitanya.kulkarni@wdc.com>
	<20200629234314.10509-11-chaitanya.kulkarni@wdc.com>
	<20200630051332.GG27033@lst.de>
	<BYAPR04MB4965E849D99120B59011CEF5866C0@BYAPR04MB4965.namprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BYAPR04MB4965E849D99120B59011CEF5866C0@BYAPR04MB4965.namprd04.prod.outlook.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: "axboe@kernel.dk" <axboe@kernel.dk>,
	"paolo.valente@linaro.org" <paolo.valente@linaro.org>,
	"sagi@grimberg.me" <sagi@grimberg.me>,
	"snitzer@redhat.com" <snitzer@redhat.com>,
	"fangguoju@gmail.com" <fangguoju@gmail.com>,
	"rdunlap@infradead.org" <rdunlap@infradead.org>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>,
	"ming.lei@redhat.com" <ming.lei@redhat.com>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"mingo@redhat.com" <mingo@redhat.com>, "colyli@suse.de" <colyli@suse.de>,
	"jack@suse.czi" <jack@suse.czi>, Christoph Hellwig <hch@lst.de>,
	"agk@redhat.com" <agk@redhat.com>,
	"bvanassche@acm.org" <bvanassche@acm.org>
Subject: Re: [dm-devel] [PATCH 10/11] block: use block_bio class for getrq
	and sleeprq
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Jul 01, 2020 at 04:45:03AM +0000, Chaitanya Kulkarni wrote:
> On 6/29/20 10:13 PM, Christoph Hellwig wrote:
> > On Mon, Jun 29, 2020 at 04:43:13PM -0700, Chaitanya Kulkarni wrote:
> >> The only difference in block_get_rq and block_bio was the last param
> >> passed  __entry->nr_sector & bio->bi_iter.bi_size respectively. Since
> >> that is not the case anymore replace block_get_rq class with block_bio
> >> for block_getrq and block_sleeprq events, also adjust the code to handle
> >> null bio case in block_bio.
> > To me it seems like keeping the NULL bio case separate actually is a
> > little simpler..
> > 
> > 
> 
> Keeping it separate will have an extra event class and related
> event(s) for only handling null bio case.
> 
> Also the block_get_rq class uses 4 comparisons with ?:.
> This patch reduces it to only one comparison in fast path.
> 
> With above explanation does it make sense to get rid of the
> blk_get_rq ?

Without this we don't need the request_queue argument to the bio
class, as we can derive it from the bio, and don't have any
conditionals at all.  I'd rather keep the special case with a 
queue and an optional bio separate.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

