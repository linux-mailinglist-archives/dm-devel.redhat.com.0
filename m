Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D25E7B730
	for <lists+dm-devel@lfdr.de>; Wed, 31 Jul 2019 02:29:23 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 308014E927;
	Wed, 31 Jul 2019 00:29:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 63E7D19C5B;
	Wed, 31 Jul 2019 00:29:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DE7B41800202;
	Wed, 31 Jul 2019 00:29:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6V0Suri015613 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 30 Jul 2019 20:28:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5134019C65; Wed, 31 Jul 2019 00:28:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 45DF119C5B
	for <dm-devel@redhat.com>; Wed, 31 Jul 2019 00:28:51 +0000 (UTC)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E797C368E3
	for <dm-devel@redhat.com>; Wed, 31 Jul 2019 00:28:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 83660B019;
	Wed, 31 Jul 2019 00:28:49 +0000 (UTC)
From: NeilBrown <neilb@suse.com>
To: Bob Liu <bob.liu@oracle.com>,
	"Guilherme G. Piccoli" <gpiccoli@canonical.com>, linux-raid@vger.kernel.org
Date: Wed, 31 Jul 2019 10:28:41 +1000
In-Reply-To: <d730c417-a328-3df3-1e31-32b6df48b6ad@oracle.com>
References: <20190729203135.12934-1-gpiccoli@canonical.com>
	<20190729203135.12934-2-gpiccoli@canonical.com>
	<d730c417-a328-3df3-1e31-32b6df48b6ad@oracle.com>
Message-ID: <87ftmnkpxi.fsf@notabene.neil.brown.name>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.30]); Wed, 31 Jul 2019 00:28:51 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]);
	Wed, 31 Jul 2019 00:28:51 +0000 (UTC) for IP:'195.135.220.15'
	DOMAIN:'mx2.suse.de' HELO:'mx1.suse.de' FROM:'neilb@suse.com'
	RCPT:''
X-RedHat-Spam-Score: -2.3  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 195.135.220.15 mx2.suse.de 195.135.220.15
	mx2.suse.de <neilb@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.30
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, jay.vosburgh@canonical.com,
	songliubraving@fb.com, dm-devel@redhat.com, Neil F Brown <nfbrown@suse.com>
Subject: Re: [dm-devel] [PATCH 1/2] md/raid0: Introduce new array state
	'broken' for raid0
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
Content-Type: multipart/mixed; boundary="===============2372846459033689565=="
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Wed, 31 Jul 2019 00:29:21 +0000 (UTC)

--===============2372846459033689565==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30 2019, Bob Liu wrote:
>
>
> Curious why only raid0 has this issue?=20

Actually, it isn't only raid0.  'linear' has the same issue.
Probably the fix for raid0 should be applied to linear too.

NeilBrown

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEG8Yp69OQ2HB7X0l6Oeye3VZigbkFAl1A4LoACgkQOeye3VZi
gbn0wRAAuH9h2Qxza5xLzWsV8tlEajzIAXMeAxp4Q+IY9Na0AgXSZPtyyE5lv2TR
wcQhQPFc+rDV+GF2rWoDOkhLKhJENtiTUoGH8ZrhU4C9hW5NRjDx80DruXKwBRll
G5OxcVY9kCDAOPtJnQHw6YjUwvWCiuoYnGqwBqoilnprsH13gPs1YFgaX+wvAj3P
ReAYsTxXQnPOQScQLJQlyis6s+unhCb8++viZmEVSnjK7i+W4i16p2xKyZTWXmXe
FZ+rsOiSll2aaYaBHIGH4oIW7wTNFeOt0z9hJ+Ce0aoQDynccbrNgtoKvkS7NN2O
k8Ci9sGX/GAmUmMD1pZgbJaRaPzMmY61gtVh25hKBMXSe9BTn+B1X9dYm44wQdP0
+hI0lSo4aP0v+aH2KByTg8e2VOOKEgtxJbeqDybgkxjGAiKW8Q82PnCt7jPmAbth
MCFuLsRp/jBClDvvvQUAYTa5rX4rASKzdFs9bQ3O7xG78SUoBBm9qyXu2HjAbYWO
BBXKWLqOXkjol1m5NWJMvY8XIvIhl8SDZNy4kzFdbuSD7eXIWBrp+RXFo7aMdRv9
krY0LAjQKYrzB7TmK7JJmI3rvGnSzBi4pQrJNc6NjOTyaCYF2qg/4LexXa27fNXj
lmWELXJmHvz4WHPJvjhPY5FAO2NjeNNDGpb5AJy4eDhyuF7hfH8=
=ErRK
-----END PGP SIGNATURE-----
--=-=-=--


--===============2372846459033689565==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============2372846459033689565==--

