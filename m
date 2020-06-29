Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id B041C20DCCF
	for <lists+dm-devel@lfdr.de>; Mon, 29 Jun 2020 22:34:04 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-kcM9QbrrMFqlSGsqw8HbjQ-1; Mon, 29 Jun 2020 16:34:01 -0400
X-MC-Unique: kcM9QbrrMFqlSGsqw8HbjQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54646193F560;
	Mon, 29 Jun 2020 20:33:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F38F31C4;
	Mon, 29 Jun 2020 20:33:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 660C9104903;
	Mon, 29 Jun 2020 20:33:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05TKXZHR031024 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Jun 2020 16:33:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9F0B42017F03; Mon, 29 Jun 2020 20:33:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E2BD2029F78
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 20:33:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 170D18007D0
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 20:33:28 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-186-fVwsQzdAPLuA2lHF_DNc1Q-1;
	Mon, 29 Jun 2020 16:33:23 -0400
X-MC-Unique: fVwsQzdAPLuA2lHF_DNc1Q-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 65395AB76;
	Mon, 29 Jun 2020 20:33:21 +0000 (UTC)
Message-ID: <1dc69f7925f577d3cee015d80b130ffae8433d5f.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>
Date: Mon, 29 Jun 2020 22:33:20 +0200
In-Reply-To: <20200602212121.GA3266@octiron.msp.redhat.com>
References: <20200602155443.14072-1-mwilck@suse.com>
	<20200602212121.GA3266@octiron.msp.redhat.com>
User-Agent: Evolution 3.36.3
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] 11-dm-mpath.rules: Fix udev rule processing
 during coldplug
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Ben, Hi Christophe,

On Tue, 2020-06-02 at 16:21 -0500, Benjamin Marzinski wrote:
> On Tue, Jun 02, 2020 at 05:54:43PM +0200, mwilck@suse.com wrote:
> > From: Martin Wilck <mwilck@suse.com>
> > 
> > DM_SUBSYSTEM_UDEV_FLAG0 is used to indicate that upper layer
> > udev rules don't need to be processed for multipath maps, e.g.
> > for map reloads.
> > 
> > However, this can fail if maps were created during initrd
> > processing,
> > but udev processing for the change events of these maps didn't
> > complete because udevd was killed to switch root. So, in the
> > coldplug
> > case, play safe and process the rules once more.
> > 
> > Signed-off-by: Martin Wilck <mwilck@suse.com>
> Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

This patch was wrong. It doesn't hurt but it also doesn't help; it
simply has no effect because DM_SUBSYSTEM_UDEV_FLAG0
is never set on "add" uevents.

Christophe, please don't apply it.

Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

