Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 9036418F058
	for <lists+dm-devel@lfdr.de>; Mon, 23 Mar 2020 08:38:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584949086;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=BjRcF/0XBvdnMva9Q3f3kK1cahM0yhoEX/mdsR7ULW8=;
	b=I93qF2ZDnTSD0SrCYDCCBwzIXQVgo1BwgF97iVRSAEZjYsg2Zne8ewCJfHDcGffg3mlPm5
	TPPMxGL8KYHnwJNSBnrWS6aGwrtzRPzwBfAm9THUWUs4WVC4cfEzDBilA1YfY4UliAdwa/
	ZmvPcAbmhqSYctY2hRJZLl5xg5MFKRo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-5LNBaEiUOsiUusAzVHuIvg-1; Mon, 23 Mar 2020 03:38:03 -0400
X-MC-Unique: 5LNBaEiUOsiUusAzVHuIvg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3EF018C43C1;
	Mon, 23 Mar 2020 07:37:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4384E5C1B2;
	Mon, 23 Mar 2020 07:37:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C1E2818089CD;
	Mon, 23 Mar 2020 07:37:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02LFrxHc025167 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 21 Mar 2020 11:53:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 18FCD10EE825; Sat, 21 Mar 2020 15:53:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1483610EE824
	for <dm-devel@redhat.com>; Sat, 21 Mar 2020 15:53:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3207B8CC921
	for <dm-devel@redhat.com>; Sat, 21 Mar 2020 15:53:57 +0000 (UTC)
Received: from huawei.com (szxga03-in.huawei.com [45.249.212.189]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-154-QKSgTVxgPyq2YQ-vpP-Q1Q-1; Sat, 21 Mar 2020 11:53:53 -0400
X-MC-Unique: QKSgTVxgPyq2YQ-vpP-Q1Q-1
Received: from dggeml405-hub.china.huawei.com (unknown [172.30.72.54])
	by Forcepoint Email with ESMTP id 50BF9730F951277CD769;
	Sat, 21 Mar 2020 23:53:50 +0800 (CST)
Received: from DGGEML530-MBS.china.huawei.com ([169.254.8.80]) by
	dggeml405-hub.china.huawei.com ([10.3.17.49]) with mapi id
	14.03.0487.000; Sat, 21 Mar 2020 23:53:42 +0800
From: wangjufeng <wangjufeng@huawei.com>
To: "christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>,
	"Martin Wilck" <mwilck@suse.com>
Thread-Topic: multipathd: fix check_path could not resume path state
Thread-Index: AdX/l8qMla9JUe00SnCHgmzO0uO2nw==
Date: Sat, 21 Mar 2020 15:53:42 +0000
Message-ID: <723608783F175343AAB90DD84928BC3405B3531C@dggeml530-mbs.china.huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.173.220.239]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 23 Mar 2020 03:34:50 -0400
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: [dm-devel] multipathd: fix check_path could not resume path state
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed;
	boundary="_002_723608783F175343AAB90DD84928BC3405B3531Cdggeml530mbschi_"

--_002_723608783F175343AAB90DD84928BC3405B3531Cdggeml530mbschi_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>From fb655da18aefccaa09c70036b08c88a03609ec45 Mon Sep 17 00:00:00 2001
From: wangjufeng <wangjufeng@huawei.com>
Date: Sat, 21 Mar 2020 22:23:10 +0800
Subject: [PATCH] multipathd: fix check_path could not resume path state

For some unknown reason, after network recovery from disconnection,
the paths in a multipath are still in fail state. Use gdb attached
multipathd, the paths seem to be changed by orphan_path function,
pp->initialized is INIT_OK while pp->mpp is NULL, pp->dmstate is
PSTATE_UNDEF, pp->fd is -1. And the multipath could not be found in
gvecs->mpvec while it could be found by dmsetup table command.

It will lead to that the path state could not be activated by
check_path even if the iscsi device is already available.

This patch intend to add the multipath map again to avoid IO failure
or IO blocked when the above phenomenon occur.

Signed-off-by: wangjufeng <wangjufeng@huawei.com>
Reviewed-by: linfeilong <linfeilong@huawei.com>
---
 multipathd/main.c | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++=
--
 1 file changed, 51 insertions(+), 2 deletions(-)

diff --git a/multipathd/main.c b/multipathd/main.c
index 8baf9ab..4ca622c 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -1962,10 +1962,59 @@ check_path (struct vectors * vecs, struct path * pp=
, unsigned int ticks)
 =09struct config *conf;
 =09int marginal_pathgroups, marginal_changed =3D 0;
 =09int ret;
+=09char *param;
+        int major;
+        int minor;
+        int invalid =3D 0;
+        char dev_path[PATH_SIZE];
+        char *alias =3D NULL;
+=09struct multipath *mpp;
=20
 =09if ((pp->initialized =3D=3D INIT_OK ||
-=09     pp->initialized =3D=3D INIT_REQUESTED_UDEV) && !pp->mpp)
-=09=09return 0;
+=09     pp->initialized =3D=3D INIT_REQUESTED_UDEV) && !pp->mpp) {
+=09=09if (pp->initialized =3D=3D INIT_OK && !pp->mpp &&
+=09=09    pp->dmstate =3D=3D PSTATE_UNDEF && pp->fd =3D=3D -1) {
+=09=09=09mpp =3D find_mp_by_wwid(vecs->mpvec, pp->wwid);
+=09=09=09if (mpp !=3D NULL) {
+=09=09=09=09return 0;
+=09=09=09}
+=09=09=09/*
+=09=09=09 * If a multipath is not in gvecs->mpvec, while it could be found=
 in
+=09=09=09 * device-mapper devices. It should be mapped again, or multipath=
d
+=09=09=09 * can not add it again because of that check_path early return.
+=09=09=09 */
+=09=09=09param =3D convert_dev(pp->wwid, 0);
+=09=09=09conf =3D get_multipath_config();
+=09=09=09pthread_cleanup_push(put_multipath_config, conf);
+=09=09=09if (filter_wwid(conf->blist_wwid, conf->elist_wwid, param, NULL) =
> 0) {
+=09=09=09=09invalid =3D 1;
+=09=09=09}
+=09=09=09pthread_cleanup_pop(1);
+=09=09=09if (invalid) {
+=09=09=09=09condlog(2, "%s: map blacklisted", param);
+=09=09=09=09return 0;
+=09=09=09}
+
+=09=09=09if (dm_get_major_minor(param, &major, &minor) < 0) {
+=09=09=09=09return 0;
+=09=09=09} else {
+=09=09=09=09sprintf(dev_path, "dm-%d", minor);
+=09=09=09=09alias =3D dm_mapname(major, minor);
+=09=09=09=09if (!alias) {
+=09=09=09=09=09condlog(2, "fail to get alias of %s %d:%d", param, major, m=
inor);
+=09=09=09=09=09return 0;
+=09=09=09=09}
+=09=09=09=09if (ev_add_map(dev_path, alias, vecs)) {
+=09=09=09=09=09condlog(2, "fail to add map for mpp %s", alias);
+=09=09=09=09=09return 0;
+=09=09=09=09} else {
+=09=09=09=09=09condlog(2, "success to add map for mpp %s", alias);
+=09=09=09=09}
+=09=09=09}
+=09=09} else {
+=09=09=09return 0;
+=09=09}
+=09}
=20
 =09if (pp->tick)
 =09=09pp->tick -=3D (pp->tick > ticks) ? ticks : pp->tick;
--=20
1.8.3.1


--_002_723608783F175343AAB90DD84928BC3405B3531Cdggeml530mbschi_
Content-Type: application/octet-stream;
	name="multipathd-fix-check_path-could-not-resume-path-stat.patch"
Content-Description: multipathd-fix-check_path-could-not-resume-path-stat.patch
Content-Disposition: attachment;
	filename="multipathd-fix-check_path-could-not-resume-path-stat.patch"; 
	size=3112; creation-date="Sat, 21 Mar 2020 15:43:24 GMT";
	modification-date="Sat, 21 Mar 2020 15:43:24 GMT"
Content-Transfer-Encoding: base64

RnJvbSBmYjY1NWRhMThhZWZjY2FhMDljNzAwMzZiMDhjODhhMDM2MDllYzQ1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiB3YW5nanVmZW5nIDx3YW5nanVmZW5nQGh1YXdlaS5jb20+CkRh
dGU6IFNhdCwgMjEgTWFyIDIwMjAgMjI6MjM6MTAgKzA4MDAKU3ViamVjdDogW1BBVENIXSBtdWx0
aXBhdGhkOiBmaXggY2hlY2tfcGF0aCBjb3VsZCBub3QgcmVzdW1lIHBhdGggc3RhdGUKCkZvciBz
b21lIHVua25vd24gcmVhc29uLCBhZnRlciBuZXR3b3JrIHJlY292ZXJ5IGZyb20gZGlzY29ubmVj
dGlvbiwKdGhlIHBhdGhzIGluIGEgbXVsdGlwYXRoIGFyZSBzdGlsbCBpbiBmYWlsIHN0YXRlLiBV
c2UgZ2RiIGF0dGFjaGVkCm11bHRpcGF0aGQsIHRoZSBwYXRocyBzZWVtIHRvIGJlIGNoYW5nZWQg
Ynkgb3JwaGFuX3BhdGggZnVuY3Rpb24sCnBwLT5pbml0aWFsaXplZCBpcyBJTklUX09LIHdoaWxl
IHBwLT5tcHAgaXMgTlVMTCwgcHAtPmRtc3RhdGUgaXMKUFNUQVRFX1VOREVGLCBwcC0+ZmQgaXMg
LTEuIEFuZCB0aGUgbXVsdGlwYXRoIGNvdWxkIG5vdCBiZSBmb3VuZCBpbgpndmVjcy0+bXB2ZWMg
d2hpbGUgaXQgY291bGQgYmUgZm91bmQgYnkgZG1zZXR1cCB0YWJsZSBjb21tYW5kLgoKSXQgd2ls
bCBsZWFkIHRvIHRoYXQgdGhlIHBhdGggc3RhdGUgY291bGQgbm90IGJlIGFjdGl2YXRlZCBieQpj
aGVja19wYXRoIGV2ZW4gaWYgdGhlIGlzY3NpIGRldmljZSBpcyBhbHJlYWR5IGF2YWlsYWJsZS4K
ClRoaXMgcGF0Y2ggaW50ZW5kIHRvIGFkZCB0aGUgbXVsdGlwYXRoIG1hcCBhZ2FpbiB0byBhdm9p
ZCBJTyBmYWlsdXJlCm9yIElPIGJsb2NrZWQgd2hlbiB0aGUgYWJvdmUgcGhlbm9tZW5vbiBvY2N1
ci4KClNpZ25lZC1vZmYtYnk6IHdhbmdqdWZlbmcgPHdhbmdqdWZlbmdAaHVhd2VpLmNvbT4KUmV2
aWV3ZWQtYnk6IGxpbmZlaWxvbmcgPGxpbmZlaWxvbmdAaHVhd2VpLmNvbT4KLS0tCiBtdWx0aXBh
dGhkL21haW4uYyB8IDUzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNTEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9tdWx0aXBhdGhkL21haW4uYyBiL211bHRpcGF0aGQvbWFpbi5j
CmluZGV4IDhiYWY5YWIuLjRjYTYyMmMgMTAwNjQ0Ci0tLSBhL211bHRpcGF0aGQvbWFpbi5jCisr
KyBiL211bHRpcGF0aGQvbWFpbi5jCkBAIC0xOTYyLDEwICsxOTYyLDU5IEBAIGNoZWNrX3BhdGgg
KHN0cnVjdCB2ZWN0b3JzICogdmVjcywgc3RydWN0IHBhdGggKiBwcCwgdW5zaWduZWQgaW50IHRp
Y2tzKQogCXN0cnVjdCBjb25maWcgKmNvbmY7CiAJaW50IG1hcmdpbmFsX3BhdGhncm91cHMsIG1h
cmdpbmFsX2NoYW5nZWQgPSAwOwogCWludCByZXQ7CisJY2hhciAqcGFyYW07CisgICAgICAgIGlu
dCBtYWpvcjsKKyAgICAgICAgaW50IG1pbm9yOworICAgICAgICBpbnQgaW52YWxpZCA9IDA7Cisg
ICAgICAgIGNoYXIgZGV2X3BhdGhbUEFUSF9TSVpFXTsKKyAgICAgICAgY2hhciAqYWxpYXMgPSBO
VUxMOworCXN0cnVjdCBtdWx0aXBhdGggKm1wcDsKIAogCWlmICgocHAtPmluaXRpYWxpemVkID09
IElOSVRfT0sgfHwKLQkgICAgIHBwLT5pbml0aWFsaXplZCA9PSBJTklUX1JFUVVFU1RFRF9VREVW
KSAmJiAhcHAtPm1wcCkKLQkJcmV0dXJuIDA7CisJICAgICBwcC0+aW5pdGlhbGl6ZWQgPT0gSU5J
VF9SRVFVRVNURURfVURFVikgJiYgIXBwLT5tcHApIHsKKwkJaWYgKHBwLT5pbml0aWFsaXplZCA9
PSBJTklUX09LICYmICFwcC0+bXBwICYmCisJCSAgICBwcC0+ZG1zdGF0ZSA9PSBQU1RBVEVfVU5E
RUYgJiYgcHAtPmZkID09IC0xKSB7CisJCQltcHAgPSBmaW5kX21wX2J5X3d3aWQodmVjcy0+bXB2
ZWMsIHBwLT53d2lkKTsKKwkJCWlmIChtcHAgIT0gTlVMTCkgeworCQkJCXJldHVybiAwOworCQkJ
fQorCQkJLyoKKwkJCSAqIElmIGEgbXVsdGlwYXRoIGlzIG5vdCBpbiBndmVjcy0+bXB2ZWMsIHdo
aWxlIGl0IGNvdWxkIGJlIGZvdW5kIGluCisJCQkgKiBkZXZpY2UtbWFwcGVyIGRldmljZXMuIEl0
IHNob3VsZCBiZSBtYXBwZWQgYWdhaW4sIG9yIG11bHRpcGF0aGQKKwkJCSAqIGNhbiBub3QgYWRk
IGl0IGFnYWluIGJlY2F1c2Ugb2YgdGhhdCBjaGVja19wYXRoIGVhcmx5IHJldHVybi4KKwkJCSAq
LworCQkJcGFyYW0gPSBjb252ZXJ0X2RldihwcC0+d3dpZCwgMCk7CisJCQljb25mID0gZ2V0X211
bHRpcGF0aF9jb25maWcoKTsKKwkJCXB0aHJlYWRfY2xlYW51cF9wdXNoKHB1dF9tdWx0aXBhdGhf
Y29uZmlnLCBjb25mKTsKKwkJCWlmIChmaWx0ZXJfd3dpZChjb25mLT5ibGlzdF93d2lkLCBjb25m
LT5lbGlzdF93d2lkLCBwYXJhbSwgTlVMTCkgPiAwKSB7CisJCQkJaW52YWxpZCA9IDE7CisJCQl9
CisJCQlwdGhyZWFkX2NsZWFudXBfcG9wKDEpOworCQkJaWYgKGludmFsaWQpIHsKKwkJCQljb25k
bG9nKDIsICIlczogbWFwIGJsYWNrbGlzdGVkIiwgcGFyYW0pOworCQkJCXJldHVybiAwOworCQkJ
fQorCisJCQlpZiAoZG1fZ2V0X21ham9yX21pbm9yKHBhcmFtLCAmbWFqb3IsICZtaW5vcikgPCAw
KSB7CisJCQkJcmV0dXJuIDA7CisJCQl9IGVsc2UgeworCQkJCXNwcmludGYoZGV2X3BhdGgsICJk
bS0lZCIsIG1pbm9yKTsKKwkJCQlhbGlhcyA9IGRtX21hcG5hbWUobWFqb3IsIG1pbm9yKTsKKwkJ
CQlpZiAoIWFsaWFzKSB7CisJCQkJCWNvbmRsb2coMiwgImZhaWwgdG8gZ2V0IGFsaWFzIG9mICVz
ICVkOiVkIiwgcGFyYW0sIG1ham9yLCBtaW5vcik7CisJCQkJCXJldHVybiAwOworCQkJCX0KKwkJ
CQlpZiAoZXZfYWRkX21hcChkZXZfcGF0aCwgYWxpYXMsIHZlY3MpKSB7CisJCQkJCWNvbmRsb2co
MiwgImZhaWwgdG8gYWRkIG1hcCBmb3IgbXBwICVzIiwgYWxpYXMpOworCQkJCQlyZXR1cm4gMDsK
KwkJCQl9IGVsc2UgeworCQkJCQljb25kbG9nKDIsICJzdWNjZXNzIHRvIGFkZCBtYXAgZm9yIG1w
cCAlcyIsIGFsaWFzKTsKKwkJCQl9CisJCQl9CisJCX0gZWxzZSB7CisJCQlyZXR1cm4gMDsKKwkJ
fQorCX0KIAogCWlmIChwcC0+dGljaykKIAkJcHAtPnRpY2sgLT0gKHBwLT50aWNrID4gdGlja3Mp
ID8gdGlja3MgOiBwcC0+dGljazsKLS0gCjEuOC4zLjEKCg==
--_002_723608783F175343AAB90DD84928BC3405B3531Cdggeml530mbschi_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--_002_723608783F175343AAB90DD84928BC3405B3531Cdggeml530mbschi_--

