Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8800C575C70
	for <lists+dm-devel@lfdr.de>; Fri, 15 Jul 2022 09:34:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657870455;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IL6aIdDzOGP9AMYgVrcGuXnjuiu08TEacObv3e0YpOc=;
	b=U6Mweq/WAcCXpqoOg8kizAQPw5exv6UVexy91ZbvThRFV+Xf35AjWspgyeTbbNT06VqfxF
	5Klp8VnHg5NnTho/b7tSBgN2DHM7VKAzwMIJE/NxjyGH/3zCdkiQ5kZ19fSXEfudoMo1C3
	mrAFpqoIBfXjfZgUC8GrmAZImfZArJM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-r_nBlHWqNVKYUxPu7mznzw-1; Fri, 15 Jul 2022 03:34:12 -0400
X-MC-Unique: r_nBlHWqNVKYUxPu7mznzw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 70370811E87;
	Fri, 15 Jul 2022 07:34:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B96F518EB5;
	Fri, 15 Jul 2022 07:34:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0A1311947073;
	Fri, 15 Jul 2022 07:34:06 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C0D3519466DF
 for <dm-devel@listman.corp.redhat.com>; Fri, 15 Jul 2022 07:34:03 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A4DF540315D; Fri, 15 Jul 2022 07:34:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A1060492C3B
 for <dm-devel@redhat.com>; Fri, 15 Jul 2022 07:34:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 87FCD80A0B9
 for <dm-devel@redhat.com>; Fri, 15 Jul 2022 07:34:03 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-pKsnYKLlNNeFyvmlgyuwJg-1; Fri, 15 Jul 2022 03:33:59 -0400
X-MC-Unique: pKsnYKLlNNeFyvmlgyuwJg-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 690C01F8D1;
 Fri, 15 Jul 2022 07:33:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 384DE13754;
 Fri, 15 Jul 2022 07:33:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4Y0KDGUY0WLtDQAAMHmgww
 (envelope-from <mwilck@suse.com>); Fri, 15 Jul 2022 07:33:57 +0000
Message-ID: <5c7214e75574c6c380261464f92c791ab1ad371d.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Xose Vazquez Perez <xose.vazquez@gmail.com>
Date: Fri, 15 Jul 2022 09:33:56 +0200
In-Reply-To: <3ddb4a30-b478-7d34-9e55-45b0560da2cc@gmail.com>
References: <20220714190540.117283-1-xose.vazquez@gmail.com>
 <5a3b7d5920baa0d4a967f000b3b1ea61b16cbd69.camel@suse.com>
 <3ddb4a30-b478-7d34-9e55-45b0560da2cc@gmail.com>
User-Agent: Evolution 3.44.2
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: Re: [dm-devel] [PATCH 0/2] multipath-tools: update docs
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>,
 DM-DEVEL ML <dm-devel@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Fri, 2022-07-15 at 01:09 +0200, Xose Vazquez Perez wrote:
> On 7/14/22 21:38, Martin Wilck wrote:
>=20
> > On Thu, 2022-07-14 at 21:05 +0200, Xose Vazquez Perez wrote:
> > > Xose Vazquez Perez (2):
> > > =A0=A0 multipath-tools: update devel repo info in README.md
> > > =A0=A0 multipath-tools: delete README.alua
> >=20
> > Why complete delete it?
>=20
> It was written five years ago, and now maybe it is
> outdated/irrelevant.
> Three options were provided; let it be, delete it, or move the info
> to README.md
> Treat it like rfc.

For now, I'd move the information to README.md.

It clearly identifies the devices it's talking about. Sure, there
have been several generations of firmware updates since then, and
ALUA support is now mainstream on both the storage and host side.
But it also recommends to consult the storage documentation.
So, I believe keeping it won't hurt.

Perhaps we should just delete the sentence "usually it's disabled by
default"?

Martin

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

