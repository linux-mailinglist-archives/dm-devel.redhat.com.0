Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1365930D4FE
	for <lists+dm-devel@lfdr.de>; Wed,  3 Feb 2021 09:16:00 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-6zseiWtZOXiOXdVXoFyB7g-1; Wed, 03 Feb 2021 03:15:58 -0500
X-MC-Unique: 6zseiWtZOXiOXdVXoFyB7g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 548A31934100;
	Wed,  3 Feb 2021 08:15:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 700F55D9E3;
	Wed,  3 Feb 2021 08:15:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A20FE18095C9;
	Wed,  3 Feb 2021 08:15:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1138F6mj027776 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 3 Feb 2021 03:15:06 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7C9F72026D76; Wed,  3 Feb 2021 08:15:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 77A982026D49
	for <dm-devel@redhat.com>; Wed,  3 Feb 2021 08:15:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C73282DFE0
	for <dm-devel@redhat.com>; Wed,  3 Feb 2021 08:15:04 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-514-DOtJ__lqMnaObrD2QX_o2Q-1;
	Wed, 03 Feb 2021 03:15:00 -0500
X-MC-Unique: DOtJ__lqMnaObrD2QX_o2Q-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C7443ADE5;
	Wed,  3 Feb 2021 08:14:58 +0000 (UTC)
Message-ID: <85a30ad88a76e01600aa0879f727da09debf0c42.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: lixiaokeng <lixiaokeng@huawei.com>, Benjamin Marzinski
	<bmarzins@redhat.com>, Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 03 Feb 2021 09:14:57 +0100
In-Reply-To: <4c3bb639-b359-85a4-ea76-ba83347acd7c@huawei.com>
References: <20210202195744.2384-1-mwilck@suse.com>
	<4c3bb639-b359-85a4-ea76-ba83347acd7c@huawei.com>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1138F6mj027776
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] libmultipath: check if adopt_path() really
 added current path
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

On Wed, 2021-02-03 at 09:33 +0800, lixiaokeng wrote:
>=20
>=20
> On 2021/2/3 3:57, mwilck@suse.com=A0wrote:
> > From: Martin Wilck <mwilck@suse.com>
> >=20
> > The description of 2d32d6f ("libmultipath: adopt_paths(): don't
> > bail out on
> > single path failure") said "we need to check after successful call
> > to
> > adopt_paths() if that specific path had been actually added, and
> > fail in the
> > caller otherwise". But the commit failed to actually implement this
> > check.
> > Instead, it just checked if the path was member of the pathvec,
> > which will
> > almost always be the case.
> >=20
> > Fix it by checking what actually needs to be checked, membership of
> > the
> > path to be added in mpp->paths.
> >=20
> > Fixes: 2d32d6f ("libmultipath: adopt_paths(): don't bail out on
> > single path failure")
> > Signed-off-by: Martin Wilck <mwilck@suse.com>
> > ---
> >=20
> > @lixiaokeng, I believe that this fixes the issue you mentioned in
> > your
> > post "libmultipath: fix NULL dereference in get_be64".
> > Reviewed-by: Lixiaokeng <lixiaokeng@huawei.com>

Is this also a Tested-by:?=20
IOW, did it fix your issue?

Martin



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

