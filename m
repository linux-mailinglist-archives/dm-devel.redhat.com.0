Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 41C6526D4A0
	for <lists+dm-devel@lfdr.de>; Thu, 17 Sep 2020 09:25:58 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-hyqRO37vMQGjaKVjUHAE-Q-1; Thu, 17 Sep 2020 03:25:54 -0400
X-MC-Unique: hyqRO37vMQGjaKVjUHAE-Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E67DE6414A;
	Thu, 17 Sep 2020 07:25:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C00FF1002D5A;
	Thu, 17 Sep 2020 07:25:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 41524183D043;
	Thu, 17 Sep 2020 07:25:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08FAB63q003020 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 15 Sep 2020 06:11:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 98C912166BB3; Tue, 15 Sep 2020 10:11:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 947A02166BA2
	for <dm-devel@redhat.com>; Tue, 15 Sep 2020 10:11:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 60566858280
	for <dm-devel@redhat.com>; Tue, 15 Sep 2020 10:11:04 +0000 (UTC)
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net
	[217.70.178.242]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-452-mPewBY2wOYOomNnrkDRh_g-1; Tue, 15 Sep 2020 06:11:02 -0400
X-MC-Unique: mPewBY2wOYOomNnrkDRh_g-1
Received: from relay3-d.mail.gandi.net (unknown [217.70.183.195])
	by mslow2.mail.gandi.net (Postfix) with ESMTP id C24D73A15E9
	for <dm-devel@redhat.com>; Tue, 15 Sep 2020 09:19:42 +0000 (UTC)
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
	(Authenticated sender: miquel.raynal@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id A7B9F60004;
	Tue, 15 Sep 2020 09:19:26 +0000 (UTC)
Date: Tue, 15 Sep 2020 11:19:25 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Joe Perches <joe@perches.com>
Message-ID: <20200915111925.475dd3f1@xps13>
In-Reply-To: <e6387578c75736d61b2fe70d9783d91329a97eb4.camel@perches.com>
References: <e6387578c75736d61b2fe70d9783d91329a97eb4.camel@perches.com>
Organization: Bootlin
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
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08FAB63q003020
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 17 Sep 2020 03:25:18 -0400
Cc: linux-fbdev@vger.kernel.org, oss-drivers@netronome.com,
	nouveau@lists.freedesktop.org, alsa-devel <alsa-devel@alsa-project.org>,
	dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
	linux-ide@vger.kernel.org, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-afs@lists.infradead.org,
	linux-rtc@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, dccp@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-atm-general@lists.sourceforge.net,
	iommu@lists.linux-foundation.org, kvmarm@lists.cs.columbia.edu,
	coreteam@netfilter.org, intel-wired-lan@lists.osuosl.org,
	linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
	linux-mmc@vger.kernel.org, Kees Cook <kees.cook@canonical.com>,
	linux-media@vger.kernel.org, linux-pm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-nvme@lists.infradead.org, storagedev@microchip.com,
	ceph-devel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-nfs@vger.kernel.org, Jiri Kosina <trivial@kernel.org>,
	linux-parisc@vger.kernel.org, netdev@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, linux-sctp@vger.kernel.org,
	netfilter-devel@vger.kernel.org, linux-crypto@vger.kernel.org,
	bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [dm-devel] [trivial PATCH] treewide: Convert switch/case
 fallthrough; to break;
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgSm9lLAoKRm9yIE1URDoKCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRzaW0uYyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCgpSZXZpZXdlZC1ieTogTWlxdWVsIFJheW5h
bCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KCgpUaGFua3MsCk1pcXXDqGwKCgotLQpkbS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQu
Y29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=

