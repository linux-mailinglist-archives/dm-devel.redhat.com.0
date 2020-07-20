Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id D2687227039
	for <lists+dm-devel@lfdr.de>; Mon, 20 Jul 2020 23:21:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595280066;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2gjmkLjoH9MV9CCiHlVU9NkM9DYY5KC9zwul70YhuXk=;
	b=BXJbcT61+JiMJgfDCX5Okf6Fwj4qIQ+1MepL6W3bV7zc5JQB1bIpVzwAtSqjuuNBqC4RII
	v6fgexumiRy5jVlrxInRTTK3zVxCjRjP9F22lFPY/MmLbJq1TA9FW4A+3ypq+fWXhWWZPY
	sj6tiKViXRFrQHdyyt2CZX54eSxN/P0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-pH60-wZgO4ejS9lCQWsXXA-1; Mon, 20 Jul 2020 17:21:04 -0400
X-MC-Unique: pH60-wZgO4ejS9lCQWsXXA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8C37102C7EE;
	Mon, 20 Jul 2020 21:20:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B02510002B5;
	Mon, 20 Jul 2020 21:20:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 957AD1809554;
	Mon, 20 Jul 2020 21:20:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06KLKqIp017373 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 Jul 2020 17:20:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 848B01992F; Mon, 20 Jul 2020 21:20:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD6CC19746;
	Mon, 20 Jul 2020 21:20:49 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 06KLKmAi018888; 
	Mon, 20 Jul 2020 16:20:48 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 06KLKlbt018887;
	Mon, 20 Jul 2020 16:20:47 -0500
Date: Mon, 20 Jul 2020 16:20:47 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200720212047.GH11089@octiron.msp.redhat.com>
References: <20200709110330.9917-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200709110330.9917-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 00/80] multipath-tools series part VI:
 incomplete udev initialization
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

On Thu, Jul 09, 2020 at 01:03:24PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Hi Christophe, hi Ben,
> 
> This is part VI of a larger patch series for multipath-tools I've been preparing.
> It's based on the previously submitted part V.
> 
> The full series will also be available here:
> https://github.com/mwilck/multipath-tools/tree/ups/submit-2007
> 
> There are tags in that repo for each part of the series.
> This part is tagged "submit-200709-6".

for the part
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
 
> The series handles an issue observed in certain partner installations, where
> DM devices were incompletely initialized by udev - during initrd procesing,
> the "add" event had been processed, but the subsequent "change" event had not,
> because udevd had been killed before getting around to handle them.
> 
> My first attempt to fix this was based on udev rules ("11-dm-mpath.rules: Fix
> udev rule processing during coldplug"), but this patch was wrong. We have to
> add logic in multipathd itself. The most important patch in the series that
> fixed the actual customer problem is patch 76. Patch 75 was supposed to handle
> a slightly different incarnation of the same problem, which so far hasn't been
> actually observed. But I think having this patch "just in case" doesn't hurt,
> either.
> 
> Patch 78 and 79 rename "update_path_groups()", which over time has grown
> to be the main entry point for reloading maps.
> 
> Patch 80 fixes an issue which I observed while testing the first 3 patches.
> 
> Regards,
> Martin
> 
> Martin Wilck (6):
>   multipathd: uev_trigger(): handle incomplete ADD events
>   libmultipath: select_action(): force udev reload for uninitialized
>     maps
>   libmultipath: log dm_task_run() errors
>   libmultipath: move reload_map() to multipathd
>   multipathd: rename update_path_groups() -> reload_and_sync_map()
>   libmultipath: select_action(): don't drop map if alias clashes
> 
>  libmultipath/configure.c  | 112 +++++++++++++++-----------------------
>  libmultipath/configure.h  |   3 +-
>  libmultipath/devmapper.c  |  61 +++++++++++++++++----
>  libmultipath/devmapper.h  |   4 ++
>  multipathd/cli_handlers.c |   8 +--
>  multipathd/dmevents.c     |   4 +-
>  multipathd/main.c         |  71 ++++++++++++++++++++++--
>  multipathd/main.h         |   4 +-
>  multipathd/waiter.c       |   2 +
>  9 files changed, 178 insertions(+), 91 deletions(-)
> 
> -- 
> 2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

