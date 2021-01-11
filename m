Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8D8F02F18C8
	for <lists+dm-devel@lfdr.de>; Mon, 11 Jan 2021 15:54:50 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-93-xJEhzG04ObuAFLLQ2g3cmg-1; Mon, 11 Jan 2021 09:54:46 -0500
X-MC-Unique: xJEhzG04ObuAFLLQ2g3cmg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 097AB87950C;
	Mon, 11 Jan 2021 14:54:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C58685D9DB;
	Mon, 11 Jan 2021 14:54:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5CB1A4E58E;
	Mon, 11 Jan 2021 14:54:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10BEsAN0013888 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 11 Jan 2021 09:54:10 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 67FC12026D48; Mon, 11 Jan 2021 14:54:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 63AFD2026D47
	for <dm-devel@redhat.com>; Mon, 11 Jan 2021 14:54:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8AF3186E124
	for <dm-devel@redhat.com>; Mon, 11 Jan 2021 14:54:07 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-88--HR-VS__PtWohoUXy89CLA-1;
	Mon, 11 Jan 2021 09:54:03 -0500
X-MC-Unique: -HR-VS__PtWohoUXy89CLA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 347C5AB7A;
	Mon, 11 Jan 2021 14:54:02 +0000 (UTC)
Message-ID: <b40493f4316db496e80f2aca8215ac52f5acb99a.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Hannes Reinecke <hare@suse.de>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>, Benjamin Marzinski <bmarzins@redhat.com>
Date: Mon, 11 Jan 2021 15:54:01 +0100
In-Reply-To: <eabe0f24-b32f-ff5f-b808-b2c501263d8f@suse.de>
References: <3baec678cfdc3c8ed2024b2df2f316d1694fe699.camel@suse.com>
	<CABr-Gnd1TJhd7QSge+vAwrJZSHuUjW7hbKd-sFwx=zdNotv_Eg@mail.gmail.com>
	<85d7c08115fd50c413ddcd957f22f40db2215f19.camel@suse.com>
	<f74cbc725ec8cb75016e8061c46eeb628d30bb25.camel@suse.com>
	<eabe0f24-b32f-ff5f-b808-b2c501263d8f@suse.de>
User-Agent: Evolution 3.38.2
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
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 10BEsAN0013888
X-loop: dm-devel@redhat.com
Cc: dm-devel mailing list <dm-devel@redhat.com>,
	Xose Vazquez Perez <xose.vazquez@gmail.com>
Subject: [dm-devel] multipath-tools: NEW openSUSE github repo
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
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Mon, 2021-01-11 at 08:43 +0100, Hannes Reinecke wrote:
> >=20
> Looks good to me.

OK. I have renamed the repositories now. The new openSUSE repo is now
reachable as

https://github.com/openSUSE/multipath-tools

The important branches have been renamed, please update your bookmarks:

https://github.com/openSUSE/multipath-tools/tree/fixes
  (obvious bug fixes, reviewed - Christophe should be able
   to pull from here any time)
https://github.com/openSUSE/multipath-tools/tree/queue
  (less obvious and larger changes reviewed on dm-devel,
   this is where changes for new releases would be pulled from)
https://github.com/openSUSE/multipath-tools/tree/tip
  (active development)

We should discuss the git workflow. Until now, I've always rebased my
branches on Christophe's when pulling. I would like to switch to a
merge-based workflow for "queue" and "fixes". This would make it easier
for third parties to pull from these branches.=A0It would mean that
Christophe's repo won't keep a fully linear history. I'm not sure if
that matters to anyone, but I wanted to ask anyway. The "tip" branch
will continue to be rebased (onto "queue").

As discussed previously, changes regarding the multipath-tools code
itself will continue to be posted on dm-devel. Other stuff such as
github-specific changes (e.g. CI) might be handled via github PR,
without bothering the list, unless anyone objects.

The previous openSUSE repo, which will be mostly stale from now on, is
now found here:

https://github.com/openSUSE/multipath-tools-pre2021

Regards
Martin



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

