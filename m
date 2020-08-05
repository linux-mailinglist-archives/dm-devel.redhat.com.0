Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1C25C23CA69
	for <lists+dm-devel@lfdr.de>; Wed,  5 Aug 2020 14:05:45 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-qrf1iXRDNBatrFgmPPEMzQ-1; Wed, 05 Aug 2020 08:05:42 -0400
X-MC-Unique: qrf1iXRDNBatrFgmPPEMzQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C24E8014D7;
	Wed,  5 Aug 2020 12:05:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 260E4380;
	Wed,  5 Aug 2020 12:05:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 273FA1809554;
	Wed,  5 Aug 2020 12:05:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 075C57Iu007847 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 5 Aug 2020 08:05:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A9E49217B436; Wed,  5 Aug 2020 12:05:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A2BB5201FD1E
	for <dm-devel@redhat.com>; Wed,  5 Aug 2020 12:05:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3A52805F4D
	for <dm-devel@redhat.com>; Wed,  5 Aug 2020 12:05:04 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-156-ZJFTIN-fPiCtzyJajtCBtg-1;
	Wed, 05 Aug 2020 08:05:02 -0400
X-MC-Unique: ZJFTIN-fPiCtzyJajtCBtg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id D224EAB3D;
	Wed,  5 Aug 2020 12:05:17 +0000 (UTC)
Message-ID: <7a92c06bdbfdcfd3530607f4b8dbce7a5c9330a5.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 05 Aug 2020 14:05:00 +0200
In-Reply-To: <20200717212525.GR11089@octiron.msp.redhat.com>
References: <20200709103623.8302-1-mwilck@suse.com>
	<20200709103623.8302-3-mwilck@suse.com>
	<20200717212525.GR11089@octiron.msp.redhat.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 44/54] libmultipath: adopt_paths(): don't
 bail out on single path failure
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2020-07-17 at 16:25 -0500, Benjamin Marzinski wrote:
> On Thu, Jul 09, 2020 at 12:36:13PM +0200, mwilck@suse.com wrote:
> > From: Martin Wilck <mwilck@suse.com>
> > 
> > If pathinfo fails for one path to be adopted, we currently
> > fail the entire function. This may cause ev_add_path() for a valid
> > path to fail because some other path is broken. Fix it by just
> > skipping paths that don't look healthy.
> 
> This looks problematic to me.  While I agree that we shouldn't make
> ev_add_path fail because some other path failed, but what about if
> the
> path we are trying to add fails in pathinfo().  In this case
> multipathd
> won't orphan the path and it will report "path added to devmap", even
> though it wasn't. Also what is the correct response for when you try
> to create a multipath device but none of the paths can be added.
> Should multipathd create a device with no paths? 

There are 3 callers of adopt_path():

 1 add_map_with_path()
 2 ev_add_path()
 3 update_map()

adopt_paths() only ever adds new paths to a map, so in case 3), the map
would not come out without paths unless it had been empty before
already. For this caller, my patch is definitely an improvement.

For 1) and 2), we are adding a specific path, so we should test in the
caller whether that specific path was successfully added, and fail
otherwise. Would that address your concern?

Regards,
Martin



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

