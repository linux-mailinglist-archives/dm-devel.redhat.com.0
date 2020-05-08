Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 204561CB97D
	for <lists+dm-devel@lfdr.de>; Fri,  8 May 2020 23:09:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588972189;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5kkOgr+DI65t2Ienh0KTRFMfZADvHVERZSmt1LDfoGs=;
	b=ArmBHhd1WJjoWRwmc610UTCb6L5zZJPHOhXUd9BWTjqx9iozBuUgqebc3rsqkDfhoJ9Vd/
	1GNN4qE7hiud4A8lxJ+6uGNh9cFyq44dn5sQdrgwMLAVXKqLgIGkxl8Z2dlDC1EW38gD6Y
	kxtLzyYUtlMwDaT/153krvUiW+NL2Ts=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-iqUsBtRNOJyArf_MJ0A0yg-1; Fri, 08 May 2020 17:09:43 -0400
X-MC-Unique: iqUsBtRNOJyArf_MJ0A0yg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F112B100A8E8;
	Fri,  8 May 2020 21:09:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 99BA95C3FD;
	Fri,  8 May 2020 21:09:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D12D31809543;
	Fri,  8 May 2020 21:09:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 048L9Vmv018029 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 8 May 2020 17:09:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 830816109E; Fri,  8 May 2020 21:09:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 981B560BE1;
	Fri,  8 May 2020 21:09:27 +0000 (UTC)
Date: Fri, 8 May 2020 17:09:26 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: kj@orbekk.com
Message-ID: <20200508210926.GB19773@redhat.com>
References: <20200507230532.5733-1-kj@orbekk.com>
	<DM6PR04MB49726E28257263F5A1C643B386A20@DM6PR04MB4972.namprd04.prod.outlook.com>
	<dd7b8b91-776b-4458-a83a-18ab4953d2f4@www.fastmail.com>
MIME-Version: 1.0
In-Reply-To: <dd7b8b91-776b-4458-a83a-18ab4953d2f4@www.fastmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>,
	"harshads@google.com" <harshads@google.com>,
	Khazhismel Kumykov <khazhy@google.com>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Alasdair G Kergon <agk@redhat.com>
Subject: Re: [dm-devel] dm: track io errors per mapped device
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

On Fri, May 08 2020 at  3:22pm -0400,
kj@orbekk.com <kj@orbekk.com> wrote:

> On Thu, May 7, 2020, at 21:12, Chaitanya Kulkarni wrote:
> > On 05/07/2020 04:06 PM, Kjetil Orbekk wrote:
> > > +		if (tio->error)
> > > +			atomic_inc(&md->ioerr_cnt);
> > 
> > Given that there are so many errors how would user know what
> > kind of error is generated and how many times?
> 
> The intended use case is to provide an easy way to check if errors
> have occurred at all, and then the user needs to investigate using
> other means. I replied with more detail to Alasdair's email.

But most operations initiated by the user that fail will be felt by the
upper layer that the user is interfacing with.

Only exception that springs to mind is dm-writecache's writeback that
occurs after writes have already been acknowledged back to the upper
layers -- in that case dm-writecache provides an error flag that is
exposed via writecache_status.

Anyway, just not seeing why you need a upper-layer use-case agnostic
flag to know an error occurred in DM.  That layers that interface with
the DM device will have been notified of all errors.

And why just for DM devices?  Why not all block devices (in which case
DM would get this feature "for free")?

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

