Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 97B6D40DCEB
	for <lists+dm-devel@lfdr.de>; Thu, 16 Sep 2021 16:36:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631802961;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xw7ENbmjTm6L0EK48P2psGSsVnBfO84ysU8h4K5CY1k=;
	b=bgKokjv5+sO+tpwvWTj6Z68PYmOtt4RoxPv2k7bz3JIY9pXcDqNwszPXqnKn+KQuyY+eya
	/CxzaZnY5fcDzWWpUngBk//5F9/aO7ZUNZsmTtClM9Z61JbR82W8RlfaPdKTQIfrov9ZeE
	t6AXZPa5nDgPpnng++ABs/G6xkoVdtM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-MugsLB2NPjOMYGQm7zEimQ-1; Thu, 16 Sep 2021 10:35:59 -0400
X-MC-Unique: MugsLB2NPjOMYGQm7zEimQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15205824FB1;
	Thu, 16 Sep 2021 14:35:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 17AED100164A;
	Thu, 16 Sep 2021 14:35:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0DA414EA2F;
	Thu, 16 Sep 2021 14:35:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18GEWpwl025654 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 16 Sep 2021 10:32:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 204721981F; Thu, 16 Sep 2021 14:32:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4262018AD4;
	Thu, 16 Sep 2021 14:32:47 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 18GEWjFK011678; 
	Thu, 16 Sep 2021 09:32:45 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 18GEWj47011677;
	Thu, 16 Sep 2021 09:32:45 -0500
Date: Thu, 16 Sep 2021 09:32:44 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20210916143244.GW3087@octiron.msp.redhat.com>
References: <20210910114120.13665-1-mwilck@suse.com>
	<20210910114120.13665-15-mwilck@suse.com>
	<20210916001329.GZ3087@octiron.msp.redhat.com>
	<7bb868e4ff09dc2de37542009762e321a614df7f.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <7bb868e4ff09dc2de37542009762e321a614df7f.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com,
	Chongyun Wu <wu.chongyun@h3c.com>
Subject: Re: [dm-devel] [PATCH 14/35] multipathd: add "force_reconfigure"
	option
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 16, 2021 at 09:34:46AM +0200, Martin Wilck wrote:
> On Wed, 2021-09-15 at 19:13 -0500, Benjamin Marzinski wrote:
> > On Fri, Sep 10, 2021 at 01:40:59PM +0200, mwilck@suse.com=A0wrote:
> > > From: Martin Wilck <mwilck@suse.com>
> > >=20
> > > Since e3270f7 ("multipathd: use weaker "force_reload" at startup"),
> > > (multipath-tools 0.7.0), we only reload those maps that must be
> > > reloaded during startup. "multipath reconfigure", OTOH, reloads
> > > every map, which may take a long time on systems with lots of
> > > storage devices, as every DM_DEVICE_RELOAD ioctl involves a
> > > suspend/resume cycle.
> > >=20
> > > The logic we use during startup is actually very robust and catches
> > > all cases in which a reload is necessary. "reconfigure" operations
> > > are often done because of configuration changes, and usually don't
> > > require a full reload of every map.
> > >=20
> > > This patch changes the default behavior of "multipath reconfigure"
> > > to "weak" reload, like we do on startup since e3270f7. The behavior
> > > can be changed by setting the configuration option
> > > "force_reconfigure yes" before starting the reconfigure operation.
> > > "multipath -r" is also affected, but "multipath -D -r" is not.
> > >=20
> > > It would have been nice to have introduced a new cli command
> > > "reconfigure force" instead, but the way "reconfigure" is
> > > implemented, that would have required a major rewrite of the code.
> >=20
> > This looks o.k. But I don't think it would be that hard to add a new
> > multipathd command to reconfigure all the devices.=A0 My personal
> > preference would be to leave force_reconfigure off by default, so that
> > we keep the same behavior, and add a command to force a full reconfig.
> > I'll try to work up a patch with my idea that can apply on top of this.
>=20
> The problem I see is with the "delayed reconfigure" approach. We
> notify child() about a pending reconfiguration by setting
> DAEMON_RECONFIGURE. If clients can request different "types" of
> reconfiguration, we would either need an additional flag, or a new
> state (e.g. DAEMON_RECONFIGURE_FORCE) to indicate which type of
> reconfiguration was requested. And then what to we do if while one
> reconfigure is running, the admin runs both "reconfigure force" and
> "reconfigure"? We can only schedule only one reconfigure operation. We
> should probably assume "force" in that rather unlikely case.

Yeah, that was the plan.

> IMO we should not implement _both_ a configuration option
> "force_reconfigure" _and_ an additional command "reconfigure force". We
> should decide which one we want. If you can come up with a reasonable
> logic for the latter, I agree it's better.

I'm fine with that. I'll send a patch to replace this one, then.

-Ben

> Regards,
> Martin
>=20

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

