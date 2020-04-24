Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 162A31B721C
	for <lists+dm-devel@lfdr.de>; Fri, 24 Apr 2020 12:36:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587724575;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xOQCwp2QmuE7tgjzUcdpqsLJv1gMvVcyNv84avyC/7I=;
	b=BRwMx+MCUD/7OS2rnnoIJ7IqsyQ42nOaIR6k4QzXishz5Bg/+Tj+w40gcSluqTqEjieaAN
	A+a1llk5JplcQz+BpMFcgnDRWA9lngQuin/FPQErtxley/1wN1YwTECwcq9UdZuQH20lRy
	DEmf1Zf/9czpkKndro1PB0aUz04fHCQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-6yoIenDDMMq9VyNi7ME7Ag-1; Fri, 24 Apr 2020 06:36:12 -0400
X-MC-Unique: 6yoIenDDMMq9VyNi7ME7Ag-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A33518FF661;
	Fri, 24 Apr 2020 10:36:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D5F6360606;
	Fri, 24 Apr 2020 10:36:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0273E1809542;
	Fri, 24 Apr 2020 10:36:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03OAZqD5022927 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 24 Apr 2020 06:35:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 467AE202683D; Fri, 24 Apr 2020 10:35:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 42D8C2026E04
	for <dm-devel@redhat.com>; Fri, 24 Apr 2020 10:35:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C556811E77
	for <dm-devel@redhat.com>; Fri, 24 Apr 2020 10:35:49 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-250-vUf8lK_mPb6p9c2vpOl45w-1;
	Fri, 24 Apr 2020 06:35:47 -0400
X-MC-Unique: vUf8lK_mPb6p9c2vpOl45w-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 6A70B68CEE; Fri, 24 Apr 2020 12:35:43 +0200 (CEST)
Date: Fri, 24 Apr 2020 12:35:43 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ming Lei <ming.lei@redhat.com>
Message-ID: <20200424103543.GB28156@lst.de>
References: <20200424102351.475641-1-ming.lei@redhat.com>
	<20200424102351.475641-3-ming.lei@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200424102351.475641-3-ming.lei@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03OAZqD5022927
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Hannes Reinecke <hare@suse.com>,
	Bart Van Assche <bvanassche@acm.org>, Mike Snitzer <snitzer@redhat.com>,
	John Garry <john.garry@huawei.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Thomas Gleixner <tglx@linutronix.de>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [PATCH V8 02/11] block: add helper for copying
	request
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Apr 24, 2020 at 06:23:42PM +0800, Ming Lei wrote:
> Add one new helper of blk_rq_copy_request() to copy request, and the helper
> will be used in this patch for re-submitting request, so make it as a block
> layer internal helper.

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

