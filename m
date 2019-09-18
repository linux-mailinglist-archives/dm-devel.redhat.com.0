Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF84B7455
	for <lists+dm-devel@lfdr.de>; Thu, 19 Sep 2019 09:43:19 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F14BA3084037;
	Thu, 19 Sep 2019 07:43:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C1B846060D;
	Thu, 19 Sep 2019 07:43:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 00EDF180085A;
	Thu, 19 Sep 2019 07:43:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8IFWmV1006582 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 18 Sep 2019 11:32:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 632575C221; Wed, 18 Sep 2019 15:32:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx21.extmail.prod.ext.phx2.redhat.com
	[10.5.110.62])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 547A05C219;
	Wed, 18 Sep 2019 15:32:48 +0000 (UTC)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
	[172.104.155.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 48BCC18C426B;
	Wed, 18 Sep 2019 15:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6fG+7cFY8qKmNTeE0/oK7OzO5e+bx/UyTCd8HlUszGk=;
	b=ZzuVXWgde4+duuEB1OGFxwXyL
	zT5zbMFJfP50QtwClsnUB+7Mvd48Bl4ixy1YiIPOVwLntpL1zltX+RHsgjOc6wv4dWoBgou8UMZZQ
	ScL36uk7mVmpeTbMJjtwoaDJXR5hAOJ8M/NEUgx79e2ESUepbiZtd4qtYE9t6vTQWxB6E=; 
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
	([82.37.168.47] helo=ypsilon.sirena.org.uk)
	by heliosphere.sirena.org.uk with esmtpsa
	(TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
	(envelope-from <broonie@sirena.co.uk>)
	id 1iAbwI-0005tn-Oo; Wed, 18 Sep 2019 15:32:18 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
	id B53AB2742927; Wed, 18 Sep 2019 16:32:17 +0100 (BST)
Date: Wed, 18 Sep 2019 16:32:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Steffen Maier <maier@linux.ibm.com>
Message-ID: <20190918153217.GN2596@sirena.co.uk>
References: <20190807144948.28265-1-maier@linux.ibm.com>
	<20190807144948.28265-2-maier@linux.ibm.com>
	<CACVXFVM0tFj8CmcHON04_KjxR=QErCbUx0abJgG2W9OBb7akZA@mail.gmail.com>
	<yq136iccsbw.fsf@oracle.com>
	<bec80a65-9a8c-54a9-fe70-876fcbe3d592@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <bec80a65-9a8c-54a9-fe70-876fcbe3d592@linux.ibm.com>
X-Cookie: The devil finds work for idle glands.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.62]); Wed, 18 Sep 2019 15:32:47 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.62]);
	Wed, 18 Sep 2019 15:32:47 +0000 (UTC) for IP:'172.104.155.198'
	DOMAIN:'heliosphere.sirena.org.uk'
	HELO:'heliosphere.sirena.org.uk' FROM:'broonie@sirena.co.uk'
	RCPT:''
X-RedHat-Spam-Score: 0.249  (DKIM_SIGNED, DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 172.104.155.198 heliosphere.sirena.org.uk 172.104.155.198
	heliosphere.sirena.org.uk <broonie@sirena.co.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.62
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 19 Sep 2019 03:42:51 -0400
Cc: Vasily Gorbik <gor@linux.ibm.com>, linux-s390 <linux-s390@vger.kernel.org>,
	Benjamin Block <bblock@linux.ibm.com>,
	Linux SCSI List <linux-scsi@vger.kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Ming Lei <tom.leiming@gmail.com>,
	"James E . J . Bottomley" <jejb@linux.ibm.com>,
	Heiko Carstens <heiko.carstens@de.ibm.com>,
	Hannes Reinecke <hare@suse.com>, "Ewan D . Milne" <emilne@redhat.com>,
	Ming Lei <ming.lei@redhat.com>, linux-block <linux-block@vger.kernel.org>,
	"open list:DEVICE-MAPPER \(LVM\)" <dm-devel@redhat.com>,
	Linux-Next Mailing List <linux-next@vger.kernel.org>,
	Mike Snitzer <snitzer@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	Paolo Bonzini <pbonzini@redhat.com>, Christoph Hellwig <hch@lst.de>,
	Bart Van Assche <bvanassche@acm.org>
Subject: Re: [dm-devel] [PATCH 1/2] scsi: core: fix missing .cleanup_rq for
 SCSI hosts without request batching
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
Content-Type: multipart/mixed; boundary="===============4859397541990601135=="
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Thu, 19 Sep 2019 07:43:17 +0000 (UTC)


--===============4859397541990601135==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0NB0lE7sNnW8+0qW"
Content-Disposition: inline


--0NB0lE7sNnW8+0qW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 18, 2019 at 05:09:50PM +0200, Steffen Maier wrote:
> On 8/8/19 4:18 AM, Martin K. Petersen wrote:

> > I'll set up an amalgamated for-next branch tomorrow.

> Martin, is it possible that you re-wrote your for-next and it now no longer
> contains a merged 5.4/scsi-postmerge with those fixes?
> At least I cannot find the fix code in next-20190917 and it fails again for me.

Well, there's no sign of a branch called postmerge in the SCSI history
recently and I've not run into any SCSI-related conflicts so...

--0NB0lE7sNnW8+0qW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2CTgAACgkQJNaLcl1U
h9DyCQgAhI9PE5cah3tJXlfm2IgfE6DGqrY+ZgkKfYQRbESZUGGvH0C8ZHzfdF9s
ew1oLds2WQCiwXttdV/OQrmwkkHibCqk7ZruKQJpmIDN9CmRPnO1EHunK1UFVuli
YGsRLI1Lp/gzfAzbaoA7BihFFKukgTxrZYcH9SfERbpf/raKMrEB9HUbyFDeBBKN
btGkV2DjeLMwQxiwQLTNDZ8NQ9oUwkaX1kGOv3CilW2qDkueaghQnMpyw05kuddR
4F5rE8+vA4jHJssZOqsoUJiNFzc9lloTdKeUDd4tR0qgY/thaG+RA2OVgh1XR1x1
wYZjyEIwrB4FhNOMDMiIl6jcM6uoqw==
=63JF
-----END PGP SIGNATURE-----

--0NB0lE7sNnW8+0qW--


--===============4859397541990601135==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============4859397541990601135==--

