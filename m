Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id CBCD2365B0C
	for <lists+dm-devel@lfdr.de>; Tue, 20 Apr 2021 16:18:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618928297;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2jHzKqUUU+kRkQBtgJZQeZCzDses9PnVw4ePDIqI4P8=;
	b=APMO1fWe7YCsE4lWAF+p5RcCwPv/+3WAGFyqD8Q0z5xXiF2YARmg0X/SU+I+457b8o3RCQ
	MTQWmWd2JvYVeqAvBQhcCKPzF9Z+9Ug/WVWAgk5I9CgGD8gwuTtN6CARn1gSQLIvQBR1C1
	rEJ+pigT+xaSLiNk5DMZGpI66R3NzcY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-2OvQAL14PEihtag2cY-vnw-1; Tue, 20 Apr 2021 10:18:14 -0400
X-MC-Unique: 2OvQAL14PEihtag2cY-vnw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A162E107ACCA;
	Tue, 20 Apr 2021 14:18:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A76660916;
	Tue, 20 Apr 2021 14:18:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A760C44A58;
	Tue, 20 Apr 2021 14:17:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13KEHZ49006039 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 20 Apr 2021 10:17:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5666560622; Tue, 20 Apr 2021 14:17:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 268A26061F;
	Tue, 20 Apr 2021 14:17:35 +0000 (UTC)
Date: Tue, 20 Apr 2021 10:17:34 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20210420141734.GA14523@redhat.com>
References: <20210416235329.49234-1-snitzer@redhat.com>
	<20210416235329.49234-4-snitzer@redhat.com>
	<20210420093453.GB28625@lst.de>
MIME-Version: 1.0
In-Reply-To: <20210420093453.GB28625@lst.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, linux-nvme@lists.infradead.org
Subject: Re: [dm-devel] [PATCH v4 3/3] nvme: decouple basic ANA log page
 re-read support from native multipathing
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
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

On Tue, Apr 20 2021 at  5:34am -0400,
Christoph Hellwig <hch@lst.de> wrote:

> On Fri, Apr 16, 2021 at 07:53:29PM -0400, Mike Snitzer wrote:
> > Whether or not ANA is present is a choice of the target implementation;
> > the host (and whether it supports multipathing) has _zero_ influence on
> > this. If the target declares a path as 'inaccessible' the path _is_
> > inaccessible to the host. As such, ANA support should be functional
> > even if native multipathing is not.

As you well know, ANA is decoupled from multipathing in the NVMe spec.
This fix illustrates that the existing Linux NVMe ANA handling is too
tightly coupled with native NVMe multipathing. Unfortunately, you've
forced this as a means to impose your political position:

> NAK.  nvme-multipathing is the only supported option for subsystems with
> multiple controllers.

And while this is largely irrelevant to the technical review of my fix:
native nvme-multipath may be the only supported option in your world. In
mine that isn't true and never has been.

Your political posturing doesn't replace technical justification. You
don't have a compelling technical case to take the stance you do, yet
you guard it like you do. Just a really stark inconsistency in your
technical leadership that is repeatedly left unchecked by others.

Alas.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

