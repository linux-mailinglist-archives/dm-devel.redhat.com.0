Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 49DD630A754
	for <lists+dm-devel@lfdr.de>; Mon,  1 Feb 2021 13:14:31 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-AZhbzHmPMPuw-HOrrelobQ-1; Mon, 01 Feb 2021 07:14:27 -0500
X-MC-Unique: AZhbzHmPMPuw-HOrrelobQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83162B8100;
	Mon,  1 Feb 2021 12:14:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E8681975E;
	Mon,  1 Feb 2021 12:14:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 64DED50038;
	Mon,  1 Feb 2021 12:14:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 111CE3Yo010414 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 1 Feb 2021 07:14:03 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 322502166B2A; Mon,  1 Feb 2021 12:14:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CD902166B27
	for <dm-devel@redhat.com>; Mon,  1 Feb 2021 12:14:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0146A800B3A
	for <dm-devel@redhat.com>; Mon,  1 Feb 2021 12:14:01 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-193-sASrlSKwPWmaAKaRQSKXQg-1;
	Mon, 01 Feb 2021 07:13:58 -0500
X-MC-Unique: sASrlSKwPWmaAKaRQSKXQg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E7BA8ABD5;
	Mon,  1 Feb 2021 12:13:56 +0000 (UTC)
Message-ID: <035279e085cb7e4f53b00755f491103b9c92ba67.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: lixiaokeng <lixiaokeng@huawei.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>, Benjamin Marzinski <bmarzins@redhat.com>,
	dm-devel mailing list <dm-devel@redhat.com>
Date: Mon, 01 Feb 2021 13:13:56 +0100
In-Reply-To: <b9824ac2-7c64-95e0-d352-1aed99eacb12@huawei.com>
References: <d6652b08-2d6c-ac46-9d73-b252bc26f41a@huawei.com>
	<3992c887b6b9a00c4faad17c1d381d2afb4a2e86.camel@suse.com>
	<b9824ac2-7c64-95e0-d352-1aed99eacb12@huawei.com>
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
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>
Subject: Re: [dm-devel] libmultipath: fix NULL dereference in get_be64
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="=-irygsKV0hQIyIONf/ifP"

--=-irygsKV0hQIyIONf/ifP
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

On Mon, 2021-02-01 at 19:49 +0800, lixiaokeng wrote:
>=20
>=20
> On 2021/2/1 19:16, Martin Wilck wrote:
> > I don't understand. All callers (uev_add_path(), cli_add_path(),
> > check_path()) call pathinfo() first, which would return
> > PATHINFO_SKIPPED if the path was blacklisted. How do you end up=20
> > in ev_add_path() with a blacklisted path?
> >=20
> > And how is it possible that add_map_with_path(vecs, pp, 1) returns
> > non-
> > NULL and pp->mpp is NULL?
>=20
> The sdb is a local disk, stack:
>=20
> cli_add_path
> =A0=A0 ->ev_add_path
> =A0=A0=A0=A0=A0 ->add_map_with_path
> =A0=A0=A0=A0=A0=A0=A0=A0 ->adopt_paths
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ->pathinfo
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ->filter_property
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ->return PATHINFO_SKIPPED,
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ->pp->mpp is NULL and not be set
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ->return 0

This returns 0, but add_map_with_path() has this code to check whether
the path passed to it was actually added to the new map:

=09if (adopt_paths(vecs->pathvec, mpp) ||
=09    find_slot(vecs->pathvec, pp) =3D=3D -1)
=09=09goto out;  -> return NULL

So ev_add_path() should have seen a NULL return from
add_map_with_path(), should not have set start_waiter, and failed.=A0

Wait ... perhaps it could happen if after "goto rescan:" that
start_waiter was already set to one.

Can you try the attached patch?


> =A0=A0=A0=A0=A0 ->mpath_pr_event_handle
> =A0=A0=A0=A0=A0=A0=A0=A0 ->get_be64 //pp->mpp is dereference
>=20
> The multipath.conf show:
> defaults {
> =A0=A0=A0=A0=A0=A0=A0 find_multipaths no
> }
>=20
> Here, my local disks can't pass filter_property. Why?

This depends on the disk, and on your blacklisting settings. By
default, multipathd refuses paths that have neither
SCSI_IDENT_* nor ID_WWN_* properties set. See multipath.conf(5).

Regards
Martin


--=-irygsKV0hQIyIONf/ifP
Content-Disposition: attachment;
	filename*0=0001-multipathd-ev_add_path-fail-if-add_map_with_path-fai.pat;
	filename*1=ch
Content-Type: text/x-patch;
	name="0001-multipathd-ev_add_path-fail-if-add_map_with_path-fai.patch"; 
	charset="ISO-8859-15"
Content-Transfer-Encoding: base64

RnJvbSBmM2Y1NDQwZGUyNzQ1OTBkNWQyNDM5ODYxYWVjZmI3MGIxNzIxOTg4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNYXJ0aW4gV2lsY2sgPG13aWxja0BzdXNlLmNvbT4KRGF0ZTog
TW9uLCAxIEZlYiAyMDIxIDEzOjEwOjQ2ICswMTAwClN1YmplY3Q6IFtQQVRDSF0gbXVsdGlwYXRo
ZDogZXZfYWRkX3BhdGg6IGZhaWwgaWYgYWRkX21hcF93aXRoX3BhdGgoKSBmYWlscwoKSWYgc3Rh
cnRfd2FpdGVyIHdhcyBzZXQgYmVmb3JlIGFuZCB0aGUgInJlc2NhbiIgbGFiZWwgd2FzIHVzZWQs
CndlIG1heSB0cnkgdG8gc2V0IHVwIGFuIGVtcHR5L2ludmFsaWQgbWFwLgpBbHdheXMgZmFpbCBp
ZiBhZGRfbWFwX3dpdGhfcGF0aCgpIGlzbid0IHN1Y2Nlc3NmdWwuCgpTaWduZWQtb2ZmLWJ5OiBN
YXJ0aW4gV2lsY2sgPG13aWxja0BzdXNlLmNvbT4KLS0tCiBtdWx0aXBhdGhkL21haW4uYyB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL211bHRpcGF0aGQvbWFpbi5jIGIvbXVsdGlwYXRoZC9tYWluLmMKaW5kZXggNmY4NTFh
ZS4uMTM0MTg1ZiAxMDA2NDQKLS0tIGEvbXVsdGlwYXRoZC9tYWluLmMKKysrIGIvbXVsdGlwYXRo
ZC9tYWluLmMKQEAgLTEwMjgsNyArMTAyOCw3IEBAIHJlc2NhbjoKIAkJCSAqLwogCQkJc3RhcnRf
d2FpdGVyID0gMTsKIAkJfQotCQlpZiAoIXN0YXJ0X3dhaXRlcikKKwkJZWxzZQogCQkJZ290byBm
YWlsOyAvKiBsZWF2ZSBwYXRoIGFkZGVkIHRvIHBhdGh2ZWMgKi8KIAl9CiAKLS0gCjIuMjkuMgoK

--=-irygsKV0hQIyIONf/ifP
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--=-irygsKV0hQIyIONf/ifP--

