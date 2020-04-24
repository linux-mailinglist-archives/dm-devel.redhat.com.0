Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id AD0D01B720D
	for <lists+dm-devel@lfdr.de>; Fri, 24 Apr 2020 12:32:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587724375;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PVPf9rdELBIYkA+/UXishIK5scHkCYl3IBHaRHyQsmo=;
	b=ZFE2IwJieL8Ek4K74dgTBv8IoH/qiH8g3b/VPNYPyBhUpys9ftXHuZCeSsOQ3D6kvW6V6Q
	EpCBg/OEm/o0UmSs8HAIGtc5x14jk8jXVCzZdbnWK9YASZbRonXGurY1YsG1wsbdOoSPYO
	tNQgwo/kxC3QsdnqIl4QpVM7h+93ZOs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-7ZcZqUBJPsO4JkzlQNxing-1; Fri, 24 Apr 2020 06:32:53 -0400
X-MC-Unique: 7ZcZqUBJPsO4JkzlQNxing-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E517C100CD0A;
	Fri, 24 Apr 2020 10:32:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F82E1002399;
	Fri, 24 Apr 2020 10:32:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E389F1809542;
	Fri, 24 Apr 2020 10:32:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03OAWYnA022763 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 24 Apr 2020 06:32:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4810E10C6EC2; Fri, 24 Apr 2020 10:32:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 441CA10C6EC1
	for <dm-devel@redhat.com>; Fri, 24 Apr 2020 10:32:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0677885A5A1
	for <dm-devel@redhat.com>; Fri, 24 Apr 2020 10:32:29 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-216-9iPxCbYhO7ee4HSHqKfA2g-1;
	Fri, 24 Apr 2020 06:32:23 -0400
X-MC-Unique: 9iPxCbYhO7ee4HSHqKfA2g-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id AB88C68CEE; Fri, 24 Apr 2020 12:32:19 +0200 (CEST)
Date: Fri, 24 Apr 2020 12:32:19 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ming Lei <ming.lei@redhat.com>
Message-ID: <20200424103219.GA28156@lst.de>
References: <20200424102351.475641-1-ming.lei@redhat.com>
	<20200424102351.475641-2-ming.lei@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200424102351.475641-2-ming.lei@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03OAWYnA022763
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Hannes Reinecke <hare@suse.com>,
	Bart Van Assche <bvanassche@acm.org>, Mike Snitzer <snitzer@redhat.com>,
	John Garry <john.garry@huawei.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Thomas Gleixner <tglx@linutronix.de>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [PATCH V8 01/11] block: clone nr_integrity_segments
 and write_hint in blk_rq_prep_clone
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

On Fri, Apr 24, 2020 at 06:23:41PM +0800, Ming Lei wrote:
> So far blk_rq_prep_clone() is only used for setup one underlying cloned
> request from dm-rq request. block intetrity can be enabled for both dm-rq
> and the underlying queues, so it is reasonable to clone rq's
> nr_integrity_segments. Also write_hint is from bio, it should have been
> cloned too.
> 
> So clone nr_integrity_segments and write_hint in blk_rq_prep_clone.

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

