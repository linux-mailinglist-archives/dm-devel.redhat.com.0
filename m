Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id B91FA26A400
	for <lists+dm-devel@lfdr.de>; Tue, 15 Sep 2020 13:17:11 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-4NKda-NVNwiqevhkiddICg-1; Tue, 15 Sep 2020 07:17:08 -0400
X-MC-Unique: 4NKda-NVNwiqevhkiddICg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E862D188C128;
	Tue, 15 Sep 2020 11:16:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 44A9410021AA;
	Tue, 15 Sep 2020 11:16:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 45D7E44A40;
	Tue, 15 Sep 2020 11:16:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08FBGXtS009997 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 15 Sep 2020 07:16:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 92D88C6108; Tue, 15 Sep 2020 11:16:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A6EAC6125
	for <dm-devel@redhat.com>; Tue, 15 Sep 2020 11:16:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 16E3718AE948
	for <dm-devel@redhat.com>; Tue, 15 Sep 2020 11:16:31 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-557-Luf_gVWVN8yVp6lDj4gWOg-1;
	Tue, 15 Sep 2020 07:16:22 -0400
X-MC-Unique: Luf_gVWVN8yVp6lDj4gWOg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id CC2A3AF8A;
	Tue, 15 Sep 2020 11:16:35 +0000 (UTC)
Message-ID: <1fea6ca4ce7221461ddec39f37f2216e8cdd4c33.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Date: Tue, 15 Sep 2020 13:16:19 +0200
In-Reply-To: <20200821224224.13536-1-mwilck@suse.com>
References: <20200821224224.13536-1-mwilck@suse.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 0/3]  Fixes for bitfield unit tests
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, 2020-08-22 at 00:42 +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Hi Christophe, hi Ben,
> 
> embarassingly, it turns out that my unit test code for the bitfield
> code was broken in various ways, which at the same time shows that
> I didn't test this as broadly as I should have before submitting.
> The good news is that only the test code was broken, not the
> implementation itself.
> 
> With these fixes, I successfully compiled it on both little and
> big endian architectures, with and without glibc 2.27.
> (https://build.opensuse.org/package/show/Base:System/multipath-tools)
> 
> Regards,
> Martin
> 
> Martin Wilck (3):
>   multipath-tools tests: fix bitfield tests for small fields
>   multipath-tools tests: fix bitfield tests for big endian
>   multipath-tools tests: fix small bitfield tests for big endian
> 
>  tests/util.c | 146 ++++++++++++++++++++++++++++++++++++++++++-------
> --
>  1 file changed, 120 insertions(+), 26 deletions(-)

@Ben: Gentle review reminder ...

Cheers,
Martin



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

