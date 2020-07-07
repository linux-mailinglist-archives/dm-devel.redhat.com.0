Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id A1A352166E8
	for <lists+dm-devel@lfdr.de>; Tue,  7 Jul 2020 08:58:00 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-KM67MuG1MSu6-9qwxGgNPA-1; Tue, 07 Jul 2020 02:57:57 -0400
X-MC-Unique: KM67MuG1MSu6-9qwxGgNPA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D2FC107B7C3;
	Tue,  7 Jul 2020 06:57:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 919225BAD5;
	Tue,  7 Jul 2020 06:57:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3B2E26C9DA;
	Tue,  7 Jul 2020 06:57:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0676vIvB004805 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 7 Jul 2020 02:57:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 80AA5218ADCF; Tue,  7 Jul 2020 06:57:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CAD52144B4B
	for <dm-devel@redhat.com>; Tue,  7 Jul 2020 06:57:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 78B51185A797
	for <dm-devel@redhat.com>; Tue,  7 Jul 2020 06:57:15 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-373-NilfbvCZMxqWcmK1FNowPg-1;
	Tue, 07 Jul 2020 02:57:10 -0400
X-MC-Unique: NilfbvCZMxqWcmK1FNowPg-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 24C5D68AFE; Tue,  7 Jul 2020 08:57:08 +0200 (CEST)
Date: Tue, 7 Jul 2020 08:57:07 +0200
From: "hch@lst.de" <hch@lst.de>
To: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
Message-ID: <20200707065707.GA23805@lst.de>
References: <20200629234314.10509-1-chaitanya.kulkarni@wdc.com>
	<20200629234314.10509-6-chaitanya.kulkarni@wdc.com>
	<BYAPR04MB4965DFE805071F971DC8C71C866A0@BYAPR04MB4965.namprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BYAPR04MB4965DFE805071F971DC8C71C866A0@BYAPR04MB4965.namprd04.prod.outlook.com>
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
	"jack@suse.czi" <jack@suse.czi>, "hch@lst.de" <hch@lst.de>,
	"agk@redhat.com" <agk@redhat.com>,
	"bvanassche@acm.org" <bvanassche@acm.org>
Subject: Re: [dm-devel] [PATCH 05/11] block: get rid of the trace rq insert
	wrapper
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Jul 03, 2020 at 11:29:25PM +0000, Chaitanya Kulkarni wrote:
> Christoph,
> 
> On 6/29/20 4:44 PM, Chaitanya Kulkarni wrote:
> > Get rid of the wrapper for trace_block_rq_insert() and call the function
> > directly.
> > 
> > Signed-off-by: Chaitanya Kulkarni<chaitanya.kulkarni@wdc.com>
> > ---
> 
> Can we re-consider adding this patch ? here are couple of reasons:-
> 
> 1. Increase in the size of the text region of the object file:-
> 
>     By adding the trace header #include <trace/events/block.h>
>     in io-scheduler where it is calling trace_block_rq_insert()
>     increases the size of the text region of the object file
>     kyber(+215) & bfq (+317) [1].

You really shouldn't have both loaded, never mind used at the same
time.  It also avoid a function call for the scheduler fast path.

> 2. Mandatory io-sched built-in kernel compilation:-
> 
>     When testing with a different io-sched KConfig options ("*" vs "M"),
>     when kyber and bfq compilation option set to "M" having this patch
>     reports error[2].

See EXPORT_TRACEPOINT_SYMBOL_GPL.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

