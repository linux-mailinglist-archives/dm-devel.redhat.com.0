Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 082041D96CD
	for <lists+dm-devel@lfdr.de>; Tue, 19 May 2020 14:56:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589892983;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=c8nA+Pb0FzFfwLhQzn95yOdunhrvr7XCfnv7svFFsR8=;
	b=NT9s9PPysx8zgQGnLDqilEnzeBbEGO8ELgncrurXCTwO4K7zTfIwvSNiyR0Dq49N92h62m
	wTF+0ehs3Sj08AkLmePWU0R6oK+x5DWFuhqwrWn/3Bz8WQswwXNhQ4L84dASNJSlJW7zMq
	Ez48rPYZqikloMTXpA4gHOQ0cGe7HuI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-Ak-eIqgfPY60ipbDKe6l5w-1; Tue, 19 May 2020 08:56:20 -0400
X-MC-Unique: Ak-eIqgfPY60ipbDKe6l5w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C497835B40;
	Tue, 19 May 2020 12:56:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9688F1002394;
	Tue, 19 May 2020 12:56:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 86E3D4ED36;
	Tue, 19 May 2020 12:56:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04JCtkZ0022737 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 19 May 2020 08:55:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2BC1210F1BF9; Tue, 19 May 2020 12:55:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CA8510F1BF8
	for <dm-devel@redhat.com>; Tue, 19 May 2020 12:55:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA3F01859162
	for <dm-devel@redhat.com>; Tue, 19 May 2020 12:55:43 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-182-dRuveiWAM5-fUn02JV9ciQ-1;
	Tue, 19 May 2020 08:55:41 -0400
X-MC-Unique: dRuveiWAM5-fUn02JV9ciQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 72A8BAD6A;
	Tue, 19 May 2020 12:55:42 +0000 (UTC)
Message-ID: <d7168e4c5ab1a2deabb10ade2d35ea64e2c22ff7.camel@suse.com>
From: Martin Wilck <martin.wilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>
In-Reply-To: <1589864228-1363-1-git-send-email-bmarzins@redhat.com>
References: <1589864228-1363-1-git-send-email-bmarzins@redhat.com>
MIME-Version: 1.0
Date: Tue, 19 May 2020 14:55:05 +0200
User-Agent: Evolution 3.36.2
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04JCtkZ0022737
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH v2 0/6] multipath: path validation library
	prep work
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Mon, 2020-05-18 at 23:57 -0500, Benjamin Marzinski wrote:
> I've been playing around with the SID code more and I've decided to
> hold
> off on submitting the library until I have it working with the SID
> multipath module better. Instead, I've pulled out the common code
> thatremember_cmdline_wwid
> multipath -u/-c and the library can use, and put it into
> libmultipath.
>=20
> I've also removed some of the ordering differences between the
> existing
> code and my new code.  Right now, the only difference is that if a
> path
> is currently multipathed, it will always be claimed as a valid path.
>=20
> Patches 0001 & 0002 are the same as in my "RFC PATCH v2" set, and
> patch
> 0005 is the same as my "libmultipath: simplify failed wwid code"
> patch.
>=20
> Only patches 0003 and 0004 haven't been posted before.
>=20
> Changes from v1:
> 0003: Minor fixes suggested by Martin Wilck
> 0004: Fixed typo, added tests for filter_property() and switched some
>       tests to pass the check_multipathd code in various ways,
> instead
>       of skipping it, as suggested by Martin Wilck
>=20

This set (v2) doesn't apply cleanly to upstream, neither with or
without my late patches. It's been generated against a tree that
included "Make multipath add wwids from kernel cmdline mpath.wwids with
-A" (https://patchwork.kernel.org/patch/4445691/). From my series, it's
missing "libmultipath: move libsg into libmultipath".

Apart from that, for the series:

Reviewed-by: Martin Wilck <mwilck@suse.com>

Martin

--=20
Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
SUSE  Software Solutions Germany GmbH
HRB 36809, AG N=FCrnberg GF: Felix
Imend=F6rffer




--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

