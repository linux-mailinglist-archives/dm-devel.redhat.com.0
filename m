Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9849A724776
	for <lists+dm-devel@lfdr.de>; Tue,  6 Jun 2023 17:18:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686064735;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nBajgYhZbd4jb8Xi+5nuL5x3OHiCj1Hr4dhKIdtUckQ=;
	b=BZNpsBtJfGVafXsrB+Yd0ZyveZIZLguzsdTTqvcV+oe4sT39TBr+xKsAfvGTI3q5aLZLDK
	TXNVVD+3aSLv/xiioSGHBFWcDR5drHjQGd6tUweOoVHpdwXb010sZu7YPZpnyNKMT48Tqv
	cQNU/5p054aeNXZA02V7nxHSm4AUy18=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-YukPmuSVPUCPnq24fcJaIQ-1; Tue, 06 Jun 2023 11:18:52 -0400
X-MC-Unique: YukPmuSVPUCPnq24fcJaIQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C08BE80120A;
	Tue,  6 Jun 2023 15:18:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3AC8FC154D1;
	Tue,  6 Jun 2023 15:18:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1E4F919452C4;
	Tue,  6 Jun 2023 15:18:44 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D54CA19465BA
 for <dm-devel@listman.corp.redhat.com>; Tue,  6 Jun 2023 15:18:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B51ED40E6A4E; Tue,  6 Jun 2023 15:18:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE0AE40E6A43
 for <dm-devel@redhat.com>; Tue,  6 Jun 2023 15:18:42 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 935F13C11C71
 for <dm-devel@redhat.com>; Tue,  6 Jun 2023 15:18:42 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-548-pZ5XqoMpO8yoJLWLp4WTWA-1; Tue,
 06 Jun 2023 11:18:38 -0400
X-MC-Unique: pZ5XqoMpO8yoJLWLp4WTWA-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3216B1FD86;
 Tue,  6 Jun 2023 15:18:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 041D913776;
 Tue,  6 Jun 2023 15:18:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Y1IQO0xOf2TQGQAAMHmgww
 (envelope-from <mwilck@suse.com>); Tue, 06 Jun 2023 15:18:36 +0000
Message-ID: <946fc11571491dd39971288b48095b6480f7914f.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Xose Vazquez Perez <xose.vazquez@gmail.com>, Benjamin Marzinski
 <bmarzins@redhat.com>, chris@hofstaedtler.name
Date: Tue, 06 Jun 2023 17:18:36 +0200
In-Reply-To: <a674434b-d365-1f07-2c6f-6a4ffa07578f@gmail.com>
References: <a674434b-d365-1f07-2c6f-6a4ffa07578f@gmail.com>
User-Agent: Evolution 3.48.1
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [dm-devel] multipath-tools: Debian patches
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
Cc: dm-devel mailing list <dm-devel@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: suse.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Mon, 2023-06-05 at 21:59 +0200, Xose Vazquez Perez wrote:
> Hi,
>=20

I have no Debian salsa account, so I reply here, trying to reach Chris
via email.

>=20
> A complaint about upstream, "Remove library development files and all
> of libdmmp":
> https://salsa.debian.org/linux-blocks-team/multipath-tools/-/commit/8c466=
61697d757763192d8e011c9ad53358d20b7

If Chris has followed the upstream discussion, he is probably aware
that we do care about the ABI. We don't keep the libmultipath ABI
stable, but track it using ABI versioning. It is true that most of the
libmultipath headers are not used for other projects. Not installing
any headers except the public ones makes sense, actually.

The libmpathpersist API (LIBMPATHPERSIST_2.1.0) that's used by qemu is
supposed to remain stable. We have moved those parts of the ABI that
used to be more volatile into __LIBMPATHPERSIST_INT_1.0.0.

Therefore it makes sense to keep shipping mpath_persist.h and drop the
rest. If that works for Debian, it will probably work for other
distros, too.

libdmpp comes from Red Hat, perhaps Ben knows whether it is still used
by any alive project. It does have a stable API/ABI.

> And maybe these are relevant for upstream ( repo:
> https://salsa.debian.org/linux-blocks-team/multipath-tools/-/tree/master/=
debian/patches
> =A0):
>=20
> https://udd.debian.org/patches.cgi?src=3Dmultipath-tools&version=3D0.9.4-=
3
>=20

That's not how we work. We don't pick downstream patches. If
something's wrong with the upstream code, we'll happily discuss patches
from the Debian project, preferably here on dm-devel.

Regards
Martin

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

