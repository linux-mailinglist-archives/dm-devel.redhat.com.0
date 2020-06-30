Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5C9E420ED38
	for <lists+dm-devel@lfdr.de>; Tue, 30 Jun 2020 07:12:32 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-JYhI-X63M4SI2CvfnQakqQ-1; Tue, 30 Jun 2020 01:12:28 -0400
X-MC-Unique: JYhI-X63M4SI2CvfnQakqQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D6A4804002;
	Tue, 30 Jun 2020 05:12:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E6FB741A5;
	Tue, 30 Jun 2020 05:12:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0FE6787897;
	Tue, 30 Jun 2020 05:12:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05U5CJnC026281 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 30 Jun 2020 01:12:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7D74010A4F6A; Tue, 30 Jun 2020 05:12:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 78DE710A4F68
	for <dm-devel@redhat.com>; Tue, 30 Jun 2020 05:12:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6DAD91859160
	for <dm-devel@redhat.com>; Tue, 30 Jun 2020 05:12:15 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-194-C35s2SQHPmefz528CahxVg-1;
	Tue, 30 Jun 2020 01:12:05 -0400
X-MC-Unique: C35s2SQHPmefz528CahxVg-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id DCC816736F; Tue, 30 Jun 2020 07:12:02 +0200 (CEST)
Date: Tue, 30 Jun 2020 07:12:02 +0200
From: Christoph Hellwig <hch@lst.de>
To: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Message-ID: <20200630051202.GD27033@lst.de>
References: <20200629234314.10509-1-chaitanya.kulkarni@wdc.com>
	<20200629234314.10509-8-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
In-Reply-To: <20200629234314.10509-8-chaitanya.kulkarni@wdc.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, paolo.valente@linaro.org, sagi@grimberg.me,
	snitzer@redhat.com, fangguoju@gmail.com, rdunlap@infradead.org,
	rostedt@goodmis.org, ming.lei@redhat.com,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	mingo@redhat.com, colyli@suse.de, jack@suse.czi, hch@lst.de,
	agk@redhat.com, bvanassche@acm.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Jun 29, 2020 at 04:43:10PM -0700, Chaitanya Kulkarni wrote:
> Now that we have done cleanup we can safely get rid of the
> blk_trace_request_get_cgid() and replace it with
> blk_trace_bio_get_cgid().

To me the helper actually looks useful compared to open coding the
check in a bunch of callers.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

