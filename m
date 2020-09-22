Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id DA9F4274C26
	for <lists+dm-devel@lfdr.de>; Wed, 23 Sep 2020 00:35:07 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-1mDlAOX8MfqHhqHTLYjFzw-1; Tue, 22 Sep 2020 18:35:04 -0400
X-MC-Unique: 1mDlAOX8MfqHhqHTLYjFzw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95F3781CBEB;
	Tue, 22 Sep 2020 22:34:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D1A75C1A3;
	Tue, 22 Sep 2020 22:34:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BE2E144A46;
	Tue, 22 Sep 2020 22:34:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08MMYqkL030025 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 22 Sep 2020 18:34:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 950C31004142; Tue, 22 Sep 2020 22:34:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9090710EE6CF
	for <dm-devel@redhat.com>; Tue, 22 Sep 2020 22:34:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86FAA80351F
	for <dm-devel@redhat.com>; Tue, 22 Sep 2020 22:34:50 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-268-SXZCpun-MjiWOR6PAHsRHQ-1;
	Tue, 22 Sep 2020 18:34:48 -0400
X-MC-Unique: SXZCpun-MjiWOR6PAHsRHQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 4C9AFACAC;
	Tue, 22 Sep 2020 22:35:23 +0000 (UTC)
Message-ID: <df42a8a5ed7ecd27cc6d30a5561e1cc716d27033.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 23 Sep 2020 00:34:45 +0200
In-Reply-To: <20200922222726.GC11108@octiron.msp.redhat.com>
References: <AM0PR09MB289726B5423506E7A0CBFA47FE3B0@AM0PR09MB2897.eurprd09.prod.outlook.com>
	<42aa1aaf935927e169e27e035fe307fd8181f9a6.camel@suse.com>
	<20200922222726.GC11108@octiron.msp.redhat.com>
User-Agent: Evolution 3.36.5
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Frank Meinl <frank.meinl@live.de>, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] libmultipath: Allow discovery of USB devices
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 2020-09-22 at 17:27 -0500, Benjamin Marzinski wrote:
> On Tue, Sep 22, 2020 at 09:59:36PM +0200, Martin Wilck wrote:
> > On Tue, 2020-09-22 at 20:34 +0200, Frank Meinl wrote:
> > > This change adds a new configuration option allow_usb_devices. It
> > > is
> > > disabled by default, so that the behavior of existing setups is
> > > not
> > > changed. If enabled (via multipath.conf), USB devices will be
> > > found
> > > during device discovery and can be used for multipath setups.
> > > 
> > > Without this option, multipath currently ignores all USB drives,
> > > which
> > > is convenient for most users. (refer also to commit 51957eb)
> > > 
> > > However, it can be beneficial to use the multipath dm-module even
> > > if
> > > there is only a single path to an USB attached storage. In
> > > combination
> > > with the option 'queue_if_no_path', such a setup survives a
> > > temporary
> > > device disconnect without any severe consequences for the running
> > > applications. All I/O is queued until the device reappears.
> > 
> > Hm. So you want to use multipath just to enable queueing?
> > I wonder if that can't be achieved some other way; multipath seems
> > to
> > be quite big hammer for this nail. Anyway, I don't think this would
> > hurt us, so I don't have good reasons to reject it.
> > 
> > Waiting for others' opinions.
> 
> I've actually seen other cases where people are using multipath on
> single path devices just for the queuing, and when I thought about
> it, I
> realized that it makes sense. Multipath works with devices as they
> are,
> instead of needing special metadata, like lvm devices. People often
> realize that they need this after the device is already set up. Plus,
> multipath already deals with devices that have partitions or logical
> volumes on top of them. It's also easy to configure exactly how you
> want
> queueing to work. This use case might be a small nail, but it is a
> nail,
> and multipath is a reasonable tool to get the job done.
> 
> It doesn't seem too hard to write a dm target that would queue and
> retry
> IO at some configurable interval, for some configurable number of
> times,
> when it failed. But you would also need to copy the work for getting
> the
> device, and any partitons on it, to autoassemble after the frist time
> it's set up and to make sure other layers use this device instead of
> the
> underlying device. Or, people can just use multipath.

Ok. So Frank, please just clarify the remaining minor points. You may
actually want to put (a short version of) this motivation in the man
page.

Regards,
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

