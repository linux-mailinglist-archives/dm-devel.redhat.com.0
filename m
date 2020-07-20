Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 7D923226FBD
	for <lists+dm-devel@lfdr.de>; Mon, 20 Jul 2020 22:30:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595277054;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=m2BLk6Cq/u/xT523rYdfEsQjWRmOiUPzVgbc5VZx+ks=;
	b=As4C0WIVW8BcSWU40knfJ4HvxcULsdip0MOn7zUz7Lz3JTZAIfO6EFr3kuodP3h3z0hqiD
	/rXRaO54MyJXxqdTQIp9SXzdHfuMVDqgQl0dmjHYhWZYvJBNQAyfjpeHgzkg9rPindAels
	jetDxaX15gCkkFQ766b++5DzBv5bReA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-cgq0yIp3PY-dlpp2HieRMQ-1; Mon, 20 Jul 2020 16:30:52 -0400
X-MC-Unique: cgq0yIp3PY-dlpp2HieRMQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9816419057A1;
	Mon, 20 Jul 2020 20:30:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DB0A073FCF;
	Mon, 20 Jul 2020 20:30:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DF9F61809554;
	Mon, 20 Jul 2020 20:30:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06KKUTEf010122 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 Jul 2020 16:30:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 596B41002397; Mon, 20 Jul 2020 20:30:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5216A1002391;
	Mon, 20 Jul 2020 20:30:26 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 06KKUOkU018622; 
	Mon, 20 Jul 2020 15:30:24 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 06KKUOLH018621;
	Mon, 20 Jul 2020 15:30:24 -0500
Date: Mon, 20 Jul 2020 15:30:23 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200720203023.GC11089@octiron.msp.redhat.com>
References: <20200709103513.8142-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200709103513.8142-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 00/42] multipath-tools series part III:
	duplicate alias
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Jul 09, 2020 at 12:35:10PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Hi Christophe, hi Ben,
> 
> This is part II of a larger patch series for multpath-tools I've been preparing.
> It contains fixes for a customer issue where the same alias was set for
> several maps with different WWIDs in the WWIDs file.
> 
> It's based on the previously submitted part II.
> 
> The full series will also be available here:
> https://github.com/mwilck/multipath-tools/tree/ups/submit-2007
> 
> There are tags in that repo for each part of the series.
> This part is tagged "submit-200709-3".

With the first two of these patches applied , multipathd fails a
real-world situation in different, arguably worse, way than it currently
does, and I think it could do better.  If user_friendly_names is set,
but two (or more) devices weren't in the initramfs bindings file, they
will get random aliases during boot.  Assuming the devices are in the
regular filesystem bindings file, it's not super uncommon for these
devices to pick from the same alias as they use in the regular bindings
file, but with different wwids matching to different aliases.

Without these patches, multipath will rename them if possible, but if
not, they will still exist, but with the wrong alias. Existing with the
wrong alias isn't great, since things could be checking for the devices
by name, which could cause corruption. But in reality, usually they are
referenced by Labels, which will still work (since most things are
designed to not expect persistent naming of devices).  However, with
this patches, some of the devices will be deleted, which avoids the
possiblity of corruption, but in practice usually is worse because
referencing devices by label already avoids the corruption problem. 

A better idea might simply be to fallback to using the WWID as an alias,
on the offending map.  This should avoid corruption, since unless
someone manually set the WWID as an alias in multipath.conf it should be
unique. But it won't cause an existing, and possibly necessary, device
to get deleted.

-Ben
 
> Regards,
> Martin
> 
> Martin Wilck (3):
>   libmultipath: refuse creating map with duplicate alias
>   libmultipath: refuse reloading an existing map with different WWID
>   libmultipath: dm_addmap(): refuse creating map with empty WWID
> 
>  libmultipath/configure.c   | 24 ++++++++++++++++++++----
>  libmultipath/devmapper.c   | 26 +++++++++++++++-----------
>  libmultipath/structs_vec.c | 13 +++++++++++++
>  libmultipath/structs_vec.h |  1 +
>  multipathd/main.c          |  6 +++++-
>  5 files changed, 54 insertions(+), 16 deletions(-)
> 
> -- 
> 2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

