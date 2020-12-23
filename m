Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1CE612E9DB5
	for <lists+dm-devel@lfdr.de>; Mon,  4 Jan 2021 20:03:57 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-EMUo45eQMECbnmHob2JCEQ-1; Mon, 04 Jan 2021 14:03:47 -0500
X-MC-Unique: EMUo45eQMECbnmHob2JCEQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2718A100C617;
	Mon,  4 Jan 2021 19:03:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AD7E5D9D7;
	Mon,  4 Jan 2021 19:03:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4E9361809CA7;
	Mon,  4 Jan 2021 19:03:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BNFcC62031385 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 23 Dec 2020 10:38:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3FEFB20296A2; Wed, 23 Dec 2020 15:38:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B68120296A0
	for <dm-devel@redhat.com>; Wed, 23 Dec 2020 15:38:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB5151010424
	for <dm-devel@redhat.com>; Wed, 23 Dec 2020 15:38:08 +0000 (UTC)
Received: from vps-vb.mhejs.net (vps-vb.mhejs.net [37.28.154.113]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-171-6ZYLrjZoMCmCLa7IPGd6Ng-1; Wed, 23 Dec 2020 10:38:04 -0500
X-MC-Unique: 6ZYLrjZoMCmCLa7IPGd6Ng-1
Received: from MUA by vps-vb.mhejs.net with esmtps
	(TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.93.0.4)
	(envelope-from <mail@maciej.szmigiero.name>)
	id 1ks6Cp-0004Hq-UK; Wed, 23 Dec 2020 16:37:39 +0100
From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
To: Ignat Korchagin <ignat@cloudflare.com>
References: <16ffadab-42ba-f9c7-8203-87fda3dc9b44@maciej.szmigiero.name>
Message-ID: <74c7129b-a437-ebc4-1466-7fb9f034e006@maciej.szmigiero.name>
Date: Wed, 23 Dec 2020 16:37:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <16ffadab-42ba-f9c7-8203-87fda3dc9b44@maciej.szmigiero.name>
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
X-Mailman-Approved-At: Mon, 04 Jan 2021 14:03:12 -0500
Cc: Damien.LeMoal@wdc.com, herbert@gondor.apana.org.au, snitzer@redhat.com,
	kernel-team@cloudflare.com, dm-crypt@saout.de,
	linux-kernel@vger.kernel.org, nobuto.murata@canonical.com,
	ebiggers@kernel.org, Chris Mason <clm@fb.com>,
	dm-devel@redhat.com, mpatocka@redhat.com,
	linux-btrfs@vger.kernel.org, David Sterba <dsterba@suse.com>,
	Josef Bacik <josef@toxicpanda.com>, agk@redhat.com,
	linux-crypto <linux-crypto@vger.kernel.org>
Subject: Re: [dm-devel] dm-crypt with no_read_workqueue and
 no_write_workqueue + btrfs scrub = BUG()
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
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

On 14.12.2020 19:11, Maciej S. Szmigiero wrote:
> Hi,
> 
> I hit a reproducible BUG() when scrubbing a btrfs fs on top of
> a dm-crypt device with no_read_workqueue and no_write_workqueue
> flags enabled.

Still happens on the current torvalds/master.

Due to this bug it is not possible to use btrfs on top of
a dm-crypt device with no_read_workqueue and no_write_workqueue
flags enabled.

@Ignat:
Can you have a look at this as the person who added these flags?

It looks like to me that the skcipher API might not be safe to
call from a softirq context, after all.

Maciej

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

