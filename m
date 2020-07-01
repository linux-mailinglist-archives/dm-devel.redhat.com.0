Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3BC832103BC
	for <lists+dm-devel@lfdr.de>; Wed,  1 Jul 2020 08:17:19 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-ryTMSc6IP7yz1XoIlKlz-w-1; Wed, 01 Jul 2020 02:17:16 -0400
X-MC-Unique: ryTMSc6IP7yz1XoIlKlz-w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C63619253C3;
	Wed,  1 Jul 2020 06:17:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A84425C1D0;
	Wed,  1 Jul 2020 06:17:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 401C61809543;
	Wed,  1 Jul 2020 06:17:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0616GqaU017033 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 1 Jul 2020 02:16:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2EBFA2029F79; Wed,  1 Jul 2020 06:16:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1EF822029F61
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 06:16:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2995B8007B3
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 06:16:49 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-487-YPSe3IbkPli91LAj9WuUqA-1;
	Wed, 01 Jul 2020 02:16:45 -0400
X-MC-Unique: YPSe3IbkPli91LAj9WuUqA-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 380A268B02; Wed,  1 Jul 2020 08:16:41 +0200 (CEST)
Date: Wed, 1 Jul 2020 08:16:40 +0200
From: Christoph Hellwig <hch@lst.de>
To: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
Message-ID: <20200701061640.GA28483@lst.de>
References: <20200629234314.10509-1-chaitanya.kulkarni@wdc.com>
	<20200629234314.10509-8-chaitanya.kulkarni@wdc.com>
	<20200630051202.GD27033@lst.de>
	<BYAPR04MB49653ABB3E50A7D034BE8C68866C0@BYAPR04MB4965.namprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BYAPR04MB49653ABB3E50A7D034BE8C68866C0@BYAPR04MB4965.namprd04.prod.outlook.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
Subject: Re: [dm-devel] [PATCH 07/11] block: get rid of
	blk_trace_request_get_cgid()
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Jul 01, 2020 at 04:38:06AM +0000, Chaitanya Kulkarni wrote:
> On 6/29/20 10:12 PM, Christoph Hellwig wrote:
> > On Mon, Jun 29, 2020 at 04:43:10PM -0700, Chaitanya Kulkarni wrote:
> >> Now that we have done cleanup we can safely get rid of the
> >> blk_trace_request_get_cgid() and replace it with
> >> blk_trace_bio_get_cgid().
> > To me the helper actually looks useful compared to open coding the
> > check in a bunch of callers.
> > 
> 
> The helper adds an additional function call which can be avoided easily
> since blk_trace_bio_get_cgid() is written nicely, that also maintains
> the readability of the code.
> 
> Unless the cost of the function call doesn't matter and readability is
> not lost can we please not use helper ?

I think readability is lost.  I'd much rather drop the q argument
from blk_trace_request_get_cgid and keep the helper, as it pretty
clearly documents what is done.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

