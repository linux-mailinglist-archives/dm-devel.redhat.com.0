Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 199F6247F98
	for <lists+dm-devel@lfdr.de>; Tue, 18 Aug 2020 09:37:38 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-6U9j7flfPLCJM7sfh7vOrw-1; Tue, 18 Aug 2020 03:37:35 -0400
X-MC-Unique: 6U9j7flfPLCJM7sfh7vOrw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB2D51084C84;
	Tue, 18 Aug 2020 07:37:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 669B27A1CB;
	Tue, 18 Aug 2020 07:37:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E9CA96035D;
	Tue, 18 Aug 2020 07:37:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07I7bAEO022560 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 18 Aug 2020 03:37:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 07A49202279B; Tue, 18 Aug 2020 07:37:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DE6D7205EB17
	for <dm-devel@redhat.com>; Tue, 18 Aug 2020 07:37:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F60F811E93
	for <dm-devel@redhat.com>; Tue, 18 Aug 2020 07:37:06 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-512-RxSyl8IQNHalfanbvYGSxQ-1;
	Tue, 18 Aug 2020 03:37:02 -0400
X-MC-Unique: RxSyl8IQNHalfanbvYGSxQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id AA724ACC8;
	Tue, 18 Aug 2020 07:37:26 +0000 (UTC)
Message-ID: <3f3a9bf677107e868f8935db7e82fc39b916a272.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Tue, 18 Aug 2020 09:37:00 +0200
In-Reply-To: <20200817213105.GH19233@octiron.msp.redhat.com>
References: <20200812113543.26576-1-mwilck@suse.com>
	<20200812113543.26576-2-mwilck@suse.com>
	<20200817213105.GH19233@octiron.msp.redhat.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v2 76/80] libmultipath: select_action():
 force udev reload for uninitialized maps
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2020-08-17 at 16:31 -0500, Benjamin Marzinski wrote:
> On Wed, Aug 12, 2020 at 01:35:40PM +0200, mwilck@suse.com wrote:
> > From: Martin Wilck <mwilck@suse.com>
> > 
> > If we are in the reconfigure() code path, and we encounter maps to
> > be reloaded, we usually set the DM_SUBSYSTEM_UDEV_FLAG0 flag to
> > tell
> > udev not to repeat device detection steps above the multipath
> > layer.
> > However, if the map was previously uninitialized, we have to force
> > udev to reload.
> 
> Actually, this patch looks all broken now. select_reload_action()
> doesn't have a cmpp argument, but still has
> 
> mpp_ud = get_udev_for_mpp(cmpp);
> 
> Also, it's setting the action on cmpp from select_action, not mpp.
> I'm
> pretty sure that the next patch makes everything work o.k. again.

Right. Thank you for reviewing and spotting it, and apologies for the
mistake.

Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

