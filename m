Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id CF3DF18F85A
	for <lists+dm-devel@lfdr.de>; Mon, 23 Mar 2020 16:16:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584976563;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZHfAqRKT5nSDkFcQ+kWF2n3pLBnzW3sKwVi/P+Yhvr4=;
	b=cU3X7z9P93Axnno3Bs7eM6qFx0FspX/Aq8CIAPS2DjG0kLrz3qxU6FF42p7D1r9tqPLjY5
	yk5KnShUuNKyQLmio3wzif1HurP7MzXvALEaukkc3ZQiksjcrHTe9GeFgWvJUOfgDh8Fus
	HRo/vY54N36nChu+nR2/HHZA6w7MPdI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-A5wjfq0KOvaSxoZBp1tWdA-1; Mon, 23 Mar 2020 11:15:59 -0400
X-MC-Unique: A5wjfq0KOvaSxoZBp1tWdA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8524800EB6;
	Mon, 23 Mar 2020 15:15:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CB5810027AE;
	Mon, 23 Mar 2020 15:15:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C152386382;
	Mon, 23 Mar 2020 15:15:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02NFFgLI002238 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 23 Mar 2020 11:15:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5915E5DA81; Mon, 23 Mar 2020 15:15:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 851FA5DA7C;
	Mon, 23 Mar 2020 15:15:39 +0000 (UTC)
Date: Mon, 23 Mar 2020 11:15:38 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Hannes Reinecke <hare@suse.de>
Message-ID: <20200323151538.GA27573@redhat.com>
References: <20200323150352.107826-1-hare@suse.de>
MIME-Version: 1.0
In-Reply-To: <20200323150352.107826-1-hare@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, Johannes Thumshirn <jth@kernel.org>,
	dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH RFC 0/2] dm-zoned: add cache device
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

On Mon, Mar 23 2020 at 11:03am -0400,
Hannes Reinecke <hare@suse.de> wrote:

> Hi Damien,
> 
> as my original plan to upgrade bcache to work for SMR devices
> turned out to be more complex than anticipated I went for the
> simpler approach and added a 'cache' device for dm-zoned.
> It is using a normal device (eg '/dev/pmem0' :-), split it
> into zones of the same size of the original SMR device, and
> makes those 'virtual' zones avialable to dm-zoned in a similar
> manner than the existing 'random write' zoned.
> 
> The implementation is still a bit rough (one would need to add
> metadata to the cache device, too), but so far it seems to work
> quite well; still running after copying 300GB of data back and forth.
> 
> As usual, comments and reviews are welcome.

Not seeing why this needs to be so specialized (natively implemented in
dm-zoned).  Did you try stacking dm-writecache on dm-zoned?

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

