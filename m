Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 511752DE635
	for <lists+dm-devel@lfdr.de>; Fri, 18 Dec 2020 16:09:00 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-_niLJcAEPfiKALvb40eT7A-1; Fri, 18 Dec 2020 10:08:57 -0500
X-MC-Unique: _niLJcAEPfiKALvb40eT7A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE6AE107ACF8;
	Fri, 18 Dec 2020 15:08:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 272185C1C5;
	Fri, 18 Dec 2020 15:08:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 31D6A180954D;
	Fri, 18 Dec 2020 15:08:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BIF8iS7013935 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 18 Dec 2020 10:08:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C53FD2026D49; Fri, 18 Dec 2020 15:08:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BEA192026D12
	for <dm-devel@redhat.com>; Fri, 18 Dec 2020 15:08:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B6FE858280
	for <dm-devel@redhat.com>; Fri, 18 Dec 2020 15:08:42 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-357-cV2VV1WJMaeZskk8QLv4_A-1;
	Fri, 18 Dec 2020 10:08:40 -0500
X-MC-Unique: cV2VV1WJMaeZskk8QLv4_A-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B0030ACF5;
	Fri, 18 Dec 2020 15:08:38 +0000 (UTC)
Message-ID: <a79b6eea09892867bb7d1756be7d197fae667473.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Fri, 18 Dec 2020 16:08:37 +0100
In-Reply-To: <0ff1145b8e8d0bb6034206045b2d1e7b7b4b8737.camel@suse.com>
References: <20201217110018.3347-1-mwilck@suse.com>
	<20201217110018.3347-5-mwilck@suse.com>
	<20201218054820.GG3103@octiron.msp.redhat.com>
	<0ff1145b8e8d0bb6034206045b2d1e7b7b4b8737.camel@suse.com>
User-Agent: Evolution 3.36.5
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 4/7] libmultipath: force map reload if udev
	incomplete
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

On Fri, 2020-12-18 at 16:06 +0100, Martin Wilck wrote:
> 
> If this happens, the udev db for the affected maps looks more or less
> like this:
> 
> DM_UDEV_DISABLE_SUBSYSTEM_RULES_FLAG="1"
> DM_UDEV_DISABLE_DISK_RULES_FLAG="1"
> DM_UDEV_DISABLE_OTHER_RULES_FLAG="1"
> 
> The device-mapper hotplug mechanism doesn't help here, 

I meant "coldplug mechanism". Sorry.

Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

