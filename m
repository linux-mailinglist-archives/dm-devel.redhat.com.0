Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id CD3B6248726
	for <lists+dm-devel@lfdr.de>; Tue, 18 Aug 2020 16:17:47 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493--oUD-IDnNfKRGoDfSeFUUg-1; Tue, 18 Aug 2020 10:17:44 -0400
X-MC-Unique: -oUD-IDnNfKRGoDfSeFUUg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB0B3807336;
	Tue, 18 Aug 2020 14:17:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 967FE26327;
	Tue, 18 Aug 2020 14:17:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 54C5C6036D;
	Tue, 18 Aug 2020 14:17:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07HFipde004134 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 Aug 2020 11:44:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C58DE2017E93; Mon, 17 Aug 2020 15:44:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BEAFB2026F94
	for <dm-devel@redhat.com>; Mon, 17 Aug 2020 15:44:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B974805C0E
	for <dm-devel@redhat.com>; Mon, 17 Aug 2020 15:44:49 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-92-wDMmXK9wPR2fgOD2c6QfgQ-1;
	Mon, 17 Aug 2020 11:44:45 -0400
X-MC-Unique: wDMmXK9wPR2fgOD2c6QfgQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id AC783AD3A;
	Mon, 17 Aug 2020 15:45:08 +0000 (UTC)
Message-ID: <dbec56af9d3e25ab7c3806abf8ac86f4c160302f.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Zhiqiang Liu <liuzhiqiang26@huawei.com>, bmarzins@redhat.com, Christophe
	Varoqui <christophe.varoqui@opensvc.com>, Zdenek Kabelac
	<zkabelac@redhat.com>
Date: Mon, 17 Aug 2020 17:44:41 +0200
In-Reply-To: <d44fd311-e66b-b196-6735-919f02e39ff4@huawei.com>
References: <351fa23b-b730-ce22-7e89-24f26a693a6a@huawei.com>
	<2d7cd13e-d1df-5fc7-9403-1f845faf64d7@huawei.com>
	<e5de8fe451462738776acb8c4107e729828e87a2.camel@suse.com>
	<d44fd311-e66b-b196-6735-919f02e39ff4@huawei.com>
User-Agent: Evolution 3.36.4
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 18 Aug 2020 10:17:04 -0400
Cc: linfeilong <linfeilong@huawei.com>, Yanxiaodan <yanxiaodan@huawei.com>,
	dm-devel@redhat.com, lixiaokeng <lixiaokeng@huawei.com>
Subject: Re: [dm-devel] [PATCH 3/6] multipathd: adopt static char* arr in
 sd_notify_status func
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2020-08-17 at 23:33 +0800, Zhiqiang Liu wrote:
> 
> On 2020/8/17 16:35, Martin Wilck wrote:
> > On Sun, 2020-08-16 at 09:44 +0800, Zhiqiang Liu wrote:
> > > We adopt static char* array (sd_notify_status_msg) in
> > > sd_notify_status func, so it looks more simpler and easier
> > > to expand.
> > > 
> > > Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> > > Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
> > > ---
> > >  multipathd/main.c | 26 ++++++++++++--------------
> > >  1 file changed, 12 insertions(+), 14 deletions(-)
> > > 
> > > diff --git a/multipathd/main.c b/multipathd/main.c
> > > index cab1d0d..a09ccd1 100644
> > > --- a/multipathd/main.c
> > > +++ b/multipathd/main.c
> > > @@ -177,23 +177,21 @@ daemon_status(void)
> > >   * I love you too, systemd ...
> > >   */
> > >  #ifdef USE_SYSTEMD
> > > +static const char *sd_notify_status_msg[DAEMON_STATUS_SIZE] = {
> > > +	[DAEMON_INIT] = "STATUS=init",
> > > +	[DAEMON_START] = "STATUS=startup",
> > > +	[DAEMON_CONFIGURE] = "STATUS=configure",
> > > +	[DAEMON_IDLE] = "STATUS=up",
> > > +	[DAEMON_RUNNING] = "STATUS=up",
> > > +	[DAEMON_SHUTDOWN] = "STATUS=shutdown",
> > > +};
> > > +
> > 
> > This repetition of "STATUS=" looks clumsy. It's not your fault,
> > because
> > the current code does the same thing. But if you want to clean this
> > up,
> > please create the notification string in a dynamic buffer, and use
> > daemon_status() for those cases where it applies.
> > 
> > Regards
> > Martin
> > 
> Thanks for your reply.
> Besides the prefixes "STATUS=", there are also some differences
> between
> sd_notify_status_msg[DAEMON_IDLE|DAEMON_RUNNING] and
> demon_status_msg[DAEMON_IDLE|DAEMON_RUNNING].
> 
> For example,
> sd_notify_status_msg[DAEMON_RUNNING] = "STATUS=up",
> demon_status_msg[DAEMON_RUNNING] = "running"
> 
> So if we create the notification string in a dynamic buffer with
> using daemon_status, we have to make some special judgement
> on DAEMON_RUNNING and DAEMON_IDLE status. This may be why
> the sd_notify_status func was created.
> 
> We can implement both solutions. Martin, which one do you prefer?

That's what I meant with "where it applies". You treat the IDLE and
RUNNING cases first (probably in a switch statement), and use
daemon_status() for the "default" case.

The  reason we don't differentiate between "running" and "idle" in the
sd_notify() code path is that the daemon switches between these states
very often (at least once per tick) and these notifications causes lots
of dbus traffic without much value.

Regards
Martin



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

