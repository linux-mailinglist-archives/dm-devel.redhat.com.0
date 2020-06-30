Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 3353320ED3F
	for <lists+dm-devel@lfdr.de>; Tue, 30 Jun 2020 07:13:54 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-ir03PivbOU2dY_XQ4Y8TiA-1; Tue, 30 Jun 2020 01:13:50 -0400
X-MC-Unique: ir03PivbOU2dY_XQ4Y8TiA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23A13107ACF3;
	Tue, 30 Jun 2020 05:13:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 039E15C3F8;
	Tue, 30 Jun 2020 05:13:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B093D833A9;
	Tue, 30 Jun 2020 05:13:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05U5Dfxg026546 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 30 Jun 2020 01:13:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CF6A5115DB9; Tue, 30 Jun 2020 05:13:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CACE8115DB2
	for <dm-devel@redhat.com>; Tue, 30 Jun 2020 05:13:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8EDCB100CF85
	for <dm-devel@redhat.com>; Tue, 30 Jun 2020 05:13:39 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-153-dLIAGDR2P7CXNfAl25PdCQ-1;
	Tue, 30 Jun 2020 01:13:34 -0400
X-MC-Unique: dLIAGDR2P7CXNfAl25PdCQ-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 2FB886736F; Tue, 30 Jun 2020 07:13:32 +0200 (CEST)
Date: Tue, 30 Jun 2020 07:13:32 +0200
From: Christoph Hellwig <hch@lst.de>
To: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Message-ID: <20200630051332.GG27033@lst.de>
References: <20200629234314.10509-1-chaitanya.kulkarni@wdc.com>
	<20200629234314.10509-11-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
In-Reply-To: <20200629234314.10509-11-chaitanya.kulkarni@wdc.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, paolo.valente@linaro.org, sagi@grimberg.me,
	snitzer@redhat.com, fangguoju@gmail.com, rdunlap@infradead.org,
	rostedt@goodmis.org, ming.lei@redhat.com,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	mingo@redhat.com, colyli@suse.de, jack@suse.czi, hch@lst.de,
	agk@redhat.com, bvanassche@acm.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Jun 29, 2020 at 04:43:13PM -0700, Chaitanya Kulkarni wrote:
> The only difference in block_get_rq and block_bio was the last param
> passed  __entry->nr_sector & bio->bi_iter.bi_size respectively. Since
> that is not the case anymore replace block_get_rq class with block_bio
> for block_getrq and block_sleeprq events, also adjust the code to handle
> null bio case in block_bio.

To me it seems like keeping the NULL bio case separate actually is a
little simpler..

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

