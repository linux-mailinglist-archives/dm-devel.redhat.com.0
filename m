Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4173835864
	for <lists+dm-devel@lfdr.de>; Wed,  5 Jun 2019 10:18:07 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 53738307D96F;
	Wed,  5 Jun 2019 08:18:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 267475C207;
	Wed,  5 Jun 2019 08:18:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EF545206D3;
	Wed,  5 Jun 2019 08:17:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x54JMCPS013809 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 4 Jun 2019 15:22:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2967918220; Tue,  4 Jun 2019 19:22:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 01DBA608A7;
	Tue,  4 Jun 2019 19:22:06 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D2C5E307EA81;
	Tue,  4 Jun 2019 19:21:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: ezequiel) with ESMTPSA id 7052C281D9F
Message-ID: <9460817290d5846a34b81470b15ac36d88a08aad.camel@collabora.com>
From: Ezequiel Garcia <ezequiel@collabora.com>
To: Helen Koike <helen.koike@collabora.com>, Stephen Boyd
	<swboyd@chromium.org>, dm-devel@redhat.com
Date: Tue, 04 Jun 2019 16:21:10 -0300
In-Reply-To: <d6b4fb26-9a1b-0acd-ce4a-e48322a17e7d@collabora.com>
References: <20190221203334.24504-1-helen.koike@collabora.com>
	<5cf5a724.1c69fb81.1e8f0.08fb@mx.google.com>
	<d6b4fb26-9a1b-0acd-ce4a-e48322a17e7d@collabora.com>
Organization: Collabora
User-Agent: Evolution 3.30.5-1 
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.44]); Tue, 04 Jun 2019 19:21:57 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Tue, 04 Jun 2019 19:21:57 +0000 (UTC) for IP:'46.235.227.227'
	DOMAIN:'bhuna.collabora.co.uk' HELO:'bhuna.collabora.co.uk'
	FROM:'ezequiel@collabora.com' RCPT:''
X-RedHat-Spam-Score: -0.011  (RCVD_IN_DNSWL_NONE, SPF_HELO_PASS, SPF_PASS,
	UNPARSEABLE_RELAY) 46.235.227.227 bhuna.collabora.co.uk
	46.235.227.227 bhuna.collabora.co.uk <ezequiel@collabora.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 05 Jun 2019 04:13:38 -0400
Cc: wad@chromium.org, keescook@chromium.org, snitzer@redhat.com,
	linux-doc@vger.kernel.org, richard.weinberger@gmail.com,
	linux-kernel@vger.kernel.org, linux-lvm@redhat.com,
	enric.balletbo@collabora.com, kernel@collabora.com, agk@redhat.com
Subject: Re: [dm-devel] [PATCH v12] dm: add support to directly boot to a
	mapped device
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Wed, 05 Jun 2019 08:18:06 +0000 (UTC)

Hi Stephen,

On Tue, 2019-06-04 at 14:38 -0300, Helen Koike wrote:
> Hi Stephen,
> 
> On 6/3/19 8:02 PM, Stephen Boyd wrote:
> > Quoting Helen Koike (2019-02-21 12:33:34)
> > > Add a "create" module parameter, which allows device-mapper targets to be
> > > configured at boot time. This enables early use of dm targets in the boot
> > > process (as the root device or otherwise) without the need of an initramfs.
> > > 
> > > The syntax used in the boot param is based on the concise format from the
> > > dmsetup tool to follow the rule of least surprise:
> > > 
> > >         sudo dmsetup table --concise /dev/mapper/lroot
> > > 
> > > Which is:
> > >         dm-mod.create=<name>,<uuid>,<minor>,<flags>,<table>[,<table>+][;<name>,<uuid>,<minor>,<flags>,<table>[,<table>+]+]
> > > 
> > > Where,
> > >         <name>          ::= The device name.
> > >         <uuid>          ::= xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx | ""
> > >         <minor>         ::= The device minor number | ""
> > >         <flags>         ::= "ro" | "rw"
> > >         <table>         ::= <start_sector> <num_sectors> <target_type> <target_args>
> > >         <target_type>   ::= "verity" | "linear" | ...
> > > 
> > > For example, the following could be added in the boot parameters:
> > > dm-mod.create="lroot,,,rw, 0 4096 linear 98:16 0, 4096 4096 linear 98:32 0" root=/dev/dm-0
> > > 
> > > Only the targets that were tested are allowed and the ones that doesn't
> > > change any block device when the dm is create as read-only. For example,
> > > mirror and cache targets are not allowed. The rationale behind this is
> > > that if the user makes a mistake, choosing the wrong device to be the
> > > mirror or the cache can corrupt data.
> > > 
> > > The only targets allowed are:
> > > * crypt
> > > * delay
> > > * linear
> > > * snapshot-origin
> > > * striped
> > > * verity
> > > 
> > > Co-developed-by: Will Drewry <wad@chromium.org>
> > > Co-developed-by: Kees Cook <keescook@chromium.org>
> > > Co-developed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> > > Signed-off-by: Helen Koike <helen.koike@collabora.com>
> > > 
> > > ---
> > > 
> > 
> > I'm trying to boot a mainline linux kernel on a chromeos device with dm
> > verity and a USB stick but it's not working for me even with this patch.
> > I've had to hack around two problems:
> > 
> >  1) rootwait isn't considered
> > 
> >  2) verity doesn't seem to accept UUID for <hash_dev> or <dev>
> > 
> > For the first problem, it happens every boot for me because I'm trying
> > to boot off of a USB stick and it's behind a hub that takes a few
> > seconds to enumerate. If I hack up the code to call dm_init_init() after
> > the 'rootdelay' cmdline parameter is used then I can make this work. It
> > would be much nicer if the whole mechanism didn't use a late initcall
> > though. If it used a hook from prepare_namespace() and then looped
> > waiting for devices to create when rootwait was specified it would work.
> 
> The patch was implemented with late initcall partially to be contained
> in drivers/md/*, but to support rootwait, adding a hook from
> prepare_namespace seems the way to go indeed.
> 

Thanks for bringing this up.

Helen and I have been looking at this code, and we think it's possible
to move things around and add some helpers, so we can implement rootwait
behavior, without actually cluttering init/do_mounts.c.

And along the way, we might get the chance to clean-up this code even
further.

Regards,
Eze

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
