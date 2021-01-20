Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id AE0552FDB14
	for <lists+dm-devel@lfdr.de>; Wed, 20 Jan 2021 21:46:44 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-fZJ2sPvsP7icRjf1MsLphQ-1; Wed, 20 Jan 2021 15:46:41 -0500
X-MC-Unique: fZJ2sPvsP7icRjf1MsLphQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ECF201800D41;
	Wed, 20 Jan 2021 20:46:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B8865C728;
	Wed, 20 Jan 2021 20:46:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 12B9A4A7C6;
	Wed, 20 Jan 2021 20:46:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10KKk7YT028495 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 20 Jan 2021 15:46:07 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 353A22166B30; Wed, 20 Jan 2021 20:46:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3035E2166B2F
	for <dm-devel@redhat.com>; Wed, 20 Jan 2021 20:46:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E59138007D9
	for <dm-devel@redhat.com>; Wed, 20 Jan 2021 20:46:03 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-63-HQkFAE2pOqy4X03jWJ-3wQ-1;
	Wed, 20 Jan 2021 15:45:59 -0500
X-MC-Unique: HQkFAE2pOqy4X03jWJ-3wQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A4A3DAC4F;
	Wed, 20 Jan 2021 20:45:57 +0000 (UTC)
Message-ID: <59c6797c4e30af5b260b054a602b58b045250e69.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Roger Heflin <rogerheflin@gmail.com>
Date: Wed, 20 Jan 2021 21:45:56 +0100
In-Reply-To: <CAAMCDec3jH4f+fFX1jjndG0g6iM5t-V+k+uFkEhBsU1EXHLRBA@mail.gmail.com>
References: <063bbeeb-15aa-f7c0-b881-7526c3a2720c@huawei.com>
	<f86753b17cc7e85e7e0f7e711adec349323a7c5a.camel@suse.com>
	<CAAMCDec3jH4f+fFX1jjndG0g6iM5t-V+k+uFkEhBsU1EXHLRBA@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 10KKk7YT028495
X-loop: dm-devel@redhat.com
Cc: lixiaokeng <lixiaokeng@huawei.com>, lihaotian9@huawei.com,
	linfeilong <linfeilong@huawei.com>,
	dm-devel mailing list <dm-devel@redhat.com>, "liuzhiqiang
	\(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [QUESTION]: multipath device with wrong path lead to
 metadata err
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-01-20 at 07:02 -0600, Roger Heflin wrote:
>=20
>=20
> I don't know if this helps, or is exactly like what he is
> duplicating:
>=20
> I debugged and verified a corruption issue a few years ago where this
> was what happened:
>=20
> DiskA was presented at say sdh (via SAN) and a multipath device was
> created on top of its paths, then diskA was unpresented and new disks
> were put back in the same zone.
> DiskB was now presented in the same slot (zone+lunid/sdh) and
> inherited by the still in place multipath device/mapping.=A0=A0=A0 In thi=
s
> case I don't believe there was ever a device level event for sdh.

If there really was no event, what should multipathd have done? We
can't poll SCSI devices for device ID changes. Even if we did, how
often should we do it? A wrong disk in an array might lead to data
corruption in the course of just a few ms.

Anyway, if this was a few years ago, I'm confident that we do better in
this area today than we used to, even if lixiaokeng's case shows that
we still have dark areas.

Regards
Martin



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

