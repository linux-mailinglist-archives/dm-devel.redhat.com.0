Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTP id BEDA840994E
	for <lists+dm-devel@lfdr.de>; Mon, 13 Sep 2021 18:33:04 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-b0ITOF1nMqyXfzPPPbbz2w-1; Mon, 13 Sep 2021 12:33:01 -0400
X-MC-Unique: b0ITOF1nMqyXfzPPPbbz2w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0501A835DE5;
	Mon, 13 Sep 2021 16:32:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2290860C13;
	Mon, 13 Sep 2021 16:32:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BE51D1800B9E;
	Mon, 13 Sep 2021 16:32:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18DGWYNK032011 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 13 Sep 2021 12:32:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E0BCE113430F; Mon, 13 Sep 2021 16:32:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DC66911342FE
	for <dm-devel@redhat.com>; Mon, 13 Sep 2021 16:32:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA31D800B29
	for <dm-devel@redhat.com>; Mon, 13 Sep 2021 16:32:30 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-436-c_5l5-5qONu_y22yjdaL7g-1; Mon, 13 Sep 2021 12:32:26 -0400
X-MC-Unique: c_5l5-5qONu_y22yjdaL7g-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2130B2202D;
	Mon, 13 Sep 2021 16:32:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C9E6C13AAB;
	Mon, 13 Sep 2021 16:32:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA id bUkaLxh9P2HwKgAAMHmgww
	(envelope-from <mwilck@suse.com>); Mon, 13 Sep 2021 16:32:24 +0000
Message-ID: <75acb52e2c012812a5b3145992281aa6f0aead24.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Mon, 13 Sep 2021 18:32:24 +0200
In-Reply-To: <20210913153239.GL3087@octiron.msp.redhat.com>
References: <c0ee4284-c2af-e7d4-29c0-fc800a8d2c94@huawei.com>
	<d8fa8e17f4ec92eba1e51c1054283688b294c9f0.camel@suse.com>
	<20210913153239.GL3087@octiron.msp.redhat.com>
User-Agent: Evolution 3.40.4
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: lixiaokeng <lixiaokeng@huawei.com>,
	dm-devel mailing list <dm-devel@redhat.com>,
	linfeilong <linfeilong@huawei.com>, "liuzhiqiang
	\(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH v2] multipathd: fix missing persistent
 reseravtion for active path
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2021-09-13 at 10:32 -0500, Benjamin Marzinski wrote:
> On Mon, Sep 13, 2021 at 09:01:11AM +0200, Martin Wilck wrote:
> > Hello lixiaokeng,
> > 
> > On Mon, 2021-09-13 at 10:43 +0800, lixiaokeng wrote:
> > > There are two paths(sucu as sda and adb) for one LUN. The two
> > > paths log in, but before the two uevents have been processed
> > > (for example there are many uevent), users use multipathd add
> > > path /dev/sda to cause mpatha and use mpathpersist -o -I to
> > > register prkey for mpatha. The add map uevent is after add path
> > > uevent, the the uevent(add sdb) will delay and missing persistent
> > > reseravtion check.
> > > 
> > > Here, we add persistent reseravtion check in update_map() which
> > > is called ev_add_map().
> > > 
> > > Signed-off-by: Lixiaokeng <lixiaokeng@huawei.com>
> > 
> > Thank you, this looks ok to me. Have you tested it?
> > 
> > I'll wait for Ben's opinion nonetheless, because he's more
> > exprerienced
> > with this part of the code than myself.
> > 
> > This said, I would like to have multipathd record which paths have
> > already registered the key, to avoid doing that repeatedly.
> > 
> Other than adding this, the patch looks fine.

I would say we can take the patch, then. We can add the record-keeping
later, I suppose it needs some deeper considerations. I wouldn't be
against lixiaokeng giving it a shot ;-)

> > Additional question to Ben in this context: what's the reason that
> > we
> > don't actively register keys (that we found in multipath.conf or
> > prkeys) during multipathd startup / reconfigure?
> 
> Like I said in my reply to the first patch, the goal was to make
> persitent reservations to multipath devices work just like with scsi
> devices.

There's no obvious way to do it for SCSI other than writing a custom 
udev rule. For multipath, we could. I see no problem with adding the
automatic registration, making it depend on a new configuration setting
(well _almost_ no problem - yet another configuration option). The
question is whether anyone would be interested in such a feature.

Regards
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

