Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id EF793227031
	for <lists+dm-devel@lfdr.de>; Mon, 20 Jul 2020 23:13:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595279589;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=A4gttFrllWBXi1jZinr1OdcIVR4T4cDW/3apdLnhD1g=;
	b=Ju18j4BJxPA1pdfkOSTgDADnS2JEStesWvXjDUZV7y+EwMLYtvXsHmkKdI2xCNmNqKvekR
	82nrv3BDM/ON/rolWKBpNVJmDi4LdVRFlxP6rmtPmcgsaYrzH88gAloRpVjhpSK2FEZcoV
	2u1sGQxslsjVFvVfTjhxfPx91qLbEc0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110-m7pzGoq3PZGCXh1_RhRZgQ-1; Mon, 20 Jul 2020 17:12:21 -0400
X-MC-Unique: m7pzGoq3PZGCXh1_RhRZgQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B32FF800688;
	Mon, 20 Jul 2020 21:12:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 938095D9D5;
	Mon, 20 Jul 2020 21:12:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 54D839A12B;
	Mon, 20 Jul 2020 21:12:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06KLC9Vj016318 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 Jul 2020 17:12:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C3AFD69314; Mon, 20 Jul 2020 21:12:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 53BCA4DA91;
	Mon, 20 Jul 2020 21:12:06 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 06KLC4vH018865; 
	Mon, 20 Jul 2020 16:12:05 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 06KLC4xr018862;
	Mon, 20 Jul 2020 16:12:04 -0500
Date: Mon, 20 Jul 2020 16:12:04 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200720211204.GF11089@octiron.msp.redhat.com>
References: <20200709103623.8302-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200709103623.8302-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 00/54] multipath-tools series part IV:
 identify paths by dev_t
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Jul 09, 2020 at 12:36:11PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Hi Christophe, hi Ben,
> 
> This is part IV of a larger patch series for multipath-tools I've been preparing.
> It's based on the previously submitted part III.
> 
> The full series will also be available here:
> https://github.com/mwilck/multipath-tools/tree/ups/submit-2007
> 
> There are tags in that repo for each part of the series.
> This part is tagged "submit-200709-4".

For the part, with the exception of patches 44 & 46
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
 
> The dominant idea of the patches in this subseries is to move away from
> the device node name as the main path identifier towards the dev_t aka
> major/minor number. This is motivated by the fact that dev_t is used by the
> kernel device mapper for referring to devices, both maps and paths.
> If searching a device by dev_t fails, it's basically certain not to exist.
> DM calls with major/minor number may even succeed if the respective devnode
> has not been created yet. dev_t also works better for devices that aren't
> fully initialized yet. Of course we still track the device name, but mostly
> for log messages and user-directed output.
> 
> In short, using dev_t as primary identifier makes our code more robust.
> 
> The subseries also contains some unrelated fixes for functions I worked on
> while making these changes.
> 
> Regards,
> Martin
> 
> Martin Wilck (12):
>   libmultipath: adopt_paths(): use find_path_by_devt()
>   libmultipath: adopt_paths(): don't bail out on single path failure
>   libmultipath: path_discover(): use find_path_by_devt()
>   libmultipath: path_discover(): always set DI_BLACKLIST
>   libmultipath: get_refwwid(): use find_path_by_devt()
>   libmultipath: get_refwwid(): call get_multipath_config() only once
>   libmultipath: get_refwwid(): get rid of "check" label
>   libmultipath: get_refwwid(): use symbolic return values
>   libmultipath: get_refwwid(): use switch statement
>   libmultipath: constify get_mpe_wwid()
>   multipath: call strchop() on command line argument
>   libmultipath: get_refwwid(): skip strchop(), and constify dev
>     parameter
> 
>  libmultipath/config.c      |   2 +-
>  libmultipath/config.h      |   2 +-
>  libmultipath/configure.c   | 200 +++++++++++++------------------------
>  libmultipath/configure.h   |   2 +-
>  libmultipath/discovery.c   |  32 +++---
>  libmultipath/structs_vec.c |  14 ++-
>  multipath/main.c           |   2 +
>  7 files changed, 94 insertions(+), 160 deletions(-)
> 
> -- 
> 2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

