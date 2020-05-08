Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 853D81CB95F
	for <lists+dm-devel@lfdr.de>; Fri,  8 May 2020 23:01:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588971667;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=d1kHJwFUBTQNx0URSyugT4FUQItPMQe7nj/GSm2wKNc=;
	b=ZL538gtNSwEIoXu5XZYa3Elo6g1C/sE0Gliouym1kdbl1U9EBAg3m01juUju3EyOYrqebi
	EC1rgcRpUoeyZ1DveHeJXNkNFAn43KVYo7pNq8ZWfJUOlsJTQaz5h+1zYO5uu+QRteBsno
	zb6JgfkAbxDn1CZrlKaYwa66i1GRXr8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-lC-63dP6NKOTCfUDYI-r5A-1; Fri, 08 May 2020 17:01:03 -0400
X-MC-Unique: lC-63dP6NKOTCfUDYI-r5A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A0A280058A;
	Fri,  8 May 2020 21:00:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FDAF5D9CA;
	Fri,  8 May 2020 21:00:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 262794CAA0;
	Fri,  8 May 2020 21:00:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 048L0XeW017359 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 8 May 2020 17:00:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DFDC060137; Fri,  8 May 2020 21:00:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 581A470461;
	Fri,  8 May 2020 21:00:30 +0000 (UTC)
Date: Fri, 8 May 2020 17:00:29 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Hannes Reinecke <hare@suse.de>
Message-ID: <20200508210029.GA19773@redhat.com>
References: <20200508090332.40716-1-hare@suse.de>
	<20200508090332.40716-2-hare@suse.de>
	<20200508162955.GA18662@redhat.com>
	<9dee23c7-76ed-d80b-bfe2-9d2930488316@suse.de>
MIME-Version: 1.0
In-Reply-To: <9dee23c7-76ed-d80b-bfe2-9d2930488316@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, Bob Liu <bob.liu@oracle.com>,
	dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 01/14] dm-zoned: add 'status' and 'message'
	callbacks
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, May 08 2020 at  2:25pm -0400,
Hannes Reinecke <hare@suse.de> wrote:

> On 5/8/20 6:29 PM, Mike Snitzer wrote:
> >On Fri, May 08 2020 at  5:03am -0400,
> >Hannes Reinecke <hare@suse.de> wrote:
> >
> >>Add callbacks to supply information for 'dmsetup status'
> >>and 'dmsetup info', and implement the message 'reclaim'
> >>to start the reclaim worker.
> >
> >Same feedback from before:
> >https://www.redhat.com/archives/dm-devel/2020-March/msg00189.html
> >
> >Who/What will use the 'reclaim' message?  Shouldn't it be documented?
> >Think the dmz_status changes should be split out from this reclaim
> >message?
> >
> 'reclaim' means that dm-zoned should start moving zones from the
> random zones to the sequential zones to free up more random zones.
> There's a threshold after which it'll start automatically, but this
> allows you to start reclaim even if the threshold isn't reached.
> You might be right, it should be documented.
> (Where? In the code?)

Documentation/admin-guide/device-mapper/dm-zoned.rst

Anything else worthy of sharing with others about v2 metadata format
would also be wise to document as part of those changes,

> As for splitting things off; yeah, I could; maybe I should if the
> 'reclaim' message turns out to be controversial...

Not controversial per se, but its disjoint from the rest of this series.
So best to split it out I think.

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

