Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id E67D71EC8CD
	for <lists+dm-devel@lfdr.de>; Wed,  3 Jun 2020 07:29:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591162192;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9V1BQAn7l0VytVagLDTSLFRxZcJWpK3/O51YMCu2MNY=;
	b=Xdzq2/Qd0Gwux0n30dWs6DVEZGKbyOZtXSekgdgMDeERZJNwgwepy/nI6VebVmcjhOb+5g
	w48M5jTtFoIxiuE2Wv6L90MNAX+wkD1ivEgt+tjwMLFra1deFMBnfn06NcljDJMz6VryOw
	lM9ZAEGgDcPlsrRv9HgT/4Nx0G6mwgs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-sHA68VzAOhKUgmV10zUekQ-1; Wed, 03 Jun 2020 01:29:50 -0400
X-MC-Unique: sHA68VzAOhKUgmV10zUekQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 863D880058E;
	Wed,  3 Jun 2020 05:29:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7301A10013D5;
	Wed,  3 Jun 2020 05:29:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3855A941D5;
	Wed,  3 Jun 2020 05:29:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0535TCiv016878 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 3 Jun 2020 01:29:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9C98B100C2B9; Wed,  3 Jun 2020 05:29:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 983CC100C2B8
	for <dm-devel@redhat.com>; Wed,  3 Jun 2020 05:29:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 903C1185A78B
	for <dm-devel@redhat.com>; Wed,  3 Jun 2020 05:29:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-379-v-9rmL9oOiGbg_QruMMtgQ-1; Wed, 03 Jun 2020 01:29:08 -0400
X-MC-Unique: v-9rmL9oOiGbg_QruMMtgQ-1
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jgLTq-0004Uf-2w; Wed, 03 Jun 2020 04:58:22 +0000
Date: Tue, 2 Jun 2020 21:58:22 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
Message-ID: <20200603045822.GA17137@infradead.org>
References: <159101473169.180989.12175693728191972447.stgit@buzz>
	<159101502963.180989.6228080995222059011.stgit@buzz>
MIME-Version: 1.0
In-Reply-To: <159101502963.180989.6228080995222059011.stgit@buzz>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
	Christoph Hellwig <hch@infradead.org>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH RFC 1/3] block: add flag 'nowait_requests'
 into queue limits
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Jun 01, 2020 at 03:37:09PM +0300, Konstantin Khlebnikov wrote:
> Add flag for marking bio-based queues which support REQ_NOWAIT.
> Set for all request based (mq) devices.
> 
> Stacking device should set it after blk_set_stacking_limits() if method
> make_request() itself doesn't delay requests or handles REQ_NOWAIT.

I don't think this belongs into the queue limits.  For example a
stacking driver that always defers requests to a workqueue can support
REQ_NOWAIT entirely independent of the underlying devices.  I think
this just needs to be a simple queue flag.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

