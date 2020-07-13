Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 898D321D2AE
	for <lists+dm-devel@lfdr.de>; Mon, 13 Jul 2020 11:22:09 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-uZDEAB34OiWvUYtFIaTxrA-1; Mon, 13 Jul 2020 05:22:05 -0400
X-MC-Unique: uZDEAB34OiWvUYtFIaTxrA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE404102C7ED;
	Mon, 13 Jul 2020 09:21:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2198E77894;
	Mon, 13 Jul 2020 09:21:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CBD05180954D;
	Mon, 13 Jul 2020 09:21:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06D9LTBm002445 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 13 Jul 2020 05:21:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B71E5218ADC5; Mon, 13 Jul 2020 09:21:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 923C5201FF95
	for <dm-devel@redhat.com>; Mon, 13 Jul 2020 09:21:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4322924902
	for <dm-devel@redhat.com>; Mon, 13 Jul 2020 09:21:26 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-239-U5MKvwRTNcuXTIjZH8lrGQ-1;
	Mon, 13 Jul 2020 05:21:22 -0400
X-MC-Unique: U5MKvwRTNcuXTIjZH8lrGQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 6977AAC1D;
	Mon, 13 Jul 2020 09:21:22 +0000 (UTC)
Message-ID: <92db2c49d0ddbbc385c6a14ef3d99a54457b908e.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: lixiaokeng <lixiaokeng@huawei.com>, Zdenek Kabelac <zkabelac@redhat.com>,
	Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Mon, 13 Jul 2020 11:21:19 +0200
In-Reply-To: <0d26c9f6-4379-f201-a9a5-839bddef3f25@huawei.com>
References: <6eb10725-456f-de68-e927-1f5a9771c16c@huawei.com>
	<86d8307c-1747-2254-4f87-fac36f0d51ca@redhat.com>
	<0d26c9f6-4379-f201-a9a5-839bddef3f25@huawei.com>
User-Agent: Evolution 3.36.3
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: linfeilong@huawei.com, dm-devel@redhat.com, liuzhiqiang26@huawei.com,
	lutianxiong@huawei.com
Subject: Re: [dm-devel] [lvm-devel] master - multipathd: fix fd leak when
 iscsi device logs in
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="=-eq+tH20cBVmKS7V2ypKB"

--=-eq+tH20cBVmKS7V2ypKB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lixiaokeng,

On Mon, 2020-07-13 at 10:15 +0800, lixiaokeng wrote:
> Hi
>=20
> Now the number of fd pointing /dev/mapper/control in multipathd
> process
> increases when iscsi device logs in. The reason is that wait_dmevents
> thread and uevqloop thread call _open_and_assign_control_fd
> concurrently.
> If lock add to _open_and_assign_control_fd fun in lvm2/libdm/libdm-
> iface.c,
> the trouble is solved easily but Zdenek Kabelac said that libdm is
> not
> pthread aware/safe library.So the lock could not be added to libdm.
> If
> the lock add to multipath-tools, there will be a lot of positions
> where
> dm_task_run is called and the lock shuold be added. It may degrade
> multipath-tools' performance. I don't have any other good idea about
> this trouble. Do you have some good idea about it? There is an
> another
> problem to me. Multipathd is a process with multi-thread and libdm is
> not pthread aware/safe library, why multipathd use libdm with no
> protect=EF=BC=9F Thanks.
>=20
> The procedure details when fd leak occurs given as follows:
> 1. wait_dmevents thread
> wait_dmevents
> ->dmevent_loop
>     ->dm_get_events (->dm_is_mpath)
>         ->dm_task_run
>             ->_open_control
>                 ->_open_and_assign_control_fd
>=20
> 2. uevqloop thread
> uevqloop
> ->uevent_dispatch
>     ->service_uevq
>         ->ev_add_path
>             ->__setup_multipath
>                 ->dm_get_info
>                     ->dm_task_run
>                         ->_open_control
>                             ->_open_and_assign_control_fd
>=20
> Lixiaokeng

Thanks for the report and the excellent analysis. The general problem
may perhaps not so bad currently, as multipathd uses the "vecs lock" to
protect its own data structures, and most libdm calls are made under
this lock. dmevent_loop() is one example where the vecs lock is not
taken.

I'm attaching a tentative patch for the particular race you reported,=20
which resorts to simply taking the vecs lock im dmevent_loop. Please
review/test. This is tentative, I haven't tested it myself beyond
making sure that it passes the unit test.

To be sure we aren't missing anything we'd need to assess if there are
other libdm calls which are not made under the vecs lock. Short-term I
have to time for a complete assessment. My guess would be that there
are a few, but not many, and most of them not prone to races.

In the long run, we need to think about the general problem of libdm
not being thread-safe. So far we've had very few reports like this
(actually, I'm aware of none), so perhaps the vecs log protects us
quite well already. OTOH, we've discussed repeatedly that the locking
in multipathd is too monolithic and should be more fine-grained; as
soon as we drop the monolithic lock, this might hit us hard. If we
introduce an additional lock for libdm, we'll have to think about
potential deadlock situations (probably easy, as the new lock would
just warp libdm calls and would thus, by definition, be at the bottom
of any lock hierarchy in libmultipath).

@Zdenek, do we have to protect every libdm call, or is it sufficient
to protect only dm_task_run(), as lixiaokeng suggested?

@Ben, please take a look as well, as you're the main author of the
dmevents code and know libdm better than me.

Regards,
Martin


>=20
> On 2020/7/9 16:54, Zdenek Kabelac wrote:
> > Dne 09. 07. 20 v 9:02 lixiaokeng napsal(a):
> > > When one iscsi device logs in and logs out several times, the
> > > number of fd, which points to '/dev/mapper/control', increases in
> > > /proc/<multipathd-pid>/fd as follows,
> > > [root@localhost fd]# ll | grep control
> > > diff --git a/libdm/ioctl/libdm-iface.c b/libdm/ioctl/libdm-
> > > iface.c
> > > index 7ad549c..7168369 100644
> > > --- a/libdm/ioctl/libdm-iface.c
> > > +++ b/libdm/ioctl/libdm-iface.c
> > > @@ -23,6 +23,7 @@
> > >   #include <sys/ioctl.h>
> > >   #include <sys/utsname.h>
> > >   #include <limits.h>
> > > +#include <pthread.h>
> > >=20
> > >   #ifdef __linux__
> > >   #  include "libdm/misc/kdev_t.h"
> > > @@ -81,6 +82,7 @@ static dm_bitset_t _dm_bitset =3D NULL;
> > >   static uint32_t _dm_device_major =3D 0;
> > >=20
> > >   static int _control_fd =3D -1;
> > > +static pthread_mutex_t _control_fd_mutex =3D
> > > PTHREAD_MUTEX_INITIALIZER;
> > >   static int _hold_control_fd_open =3D 0;
> > >   static int _version_checked =3D 0;
> > >   static int _version_ok =3D 1;
> > > @@ -404,10 +406,19 @@ static void _close_control_fd(void)
> > >   #ifdef DM_IOCTLS
> > >   static int _open_and_assign_control_fd(const char *control)
> > >   {
> > > +    pthread_mutex_lock(&_control_fd_mutex);
> > > +
> > > +    if (_control_fd !=3D -1) {
> >=20
> >=20
> > Hi
> >=20
> > libdm is not pthread aware/safe library.
> >=20
> > So the fix needs to happen on libdm user-side to prevent race call
> > of this function.
> >=20
> >=20
> > Zdenek
> >=20
> >=20
> > .


--=-eq+tH20cBVmKS7V2ypKB
Content-Disposition: attachment;
	filename="0001-libmultipath-dmevent_loop-hold-vecs-lock.patch"
Content-Type: text/x-patch;
	name="0001-libmultipath-dmevent_loop-hold-vecs-lock.patch"; 
	charset="ISO-8859-15"
Content-Transfer-Encoding: base64

RnJvbSAwNTExNTIxNzI4NmRiYmQxNjc5ZTcxYzRhYWNlYWJlNDJhZmI1ZjdmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNYXJ0aW4gV2lsY2sgPG13aWxja0BzdXNlLmNvbT4KRGF0ZTog
TW9uLCAxMyBKdWwgMjAyMCAxMTowMzo0MyArMDIwMApTdWJqZWN0OiBbUEFUQ0hdIGxpYm11bHRp
cGF0aDogZG1ldmVudF9sb29wOiBob2xkIHZlY3MgbG9jawoKVGhlIGxpYmRtIGNhbGxzIGluIHRo
ZSBldmVudCB3YWl0ZXIsIGluIHBhcnRpY3VsYXIgZ2V0X2RtX2V2ZW50cygpLAptYXkgcmFjZSB3
aXRoIGxpYmRtIGNhbGxzIGZyb20gb3RoZXIgdGhyZWFkcywgbGVhZGluZyB0byBhIGZkIGxlYWsK
Zm9yIHRoZSBsaWJkbSBjb250cm9sIGZkLgoKVGhlIHByb2NlZHVyZSBkZXRhaWxzIHdoZW4gZmQg
bGVhayBvY2N1cnMgZ2l2ZW4gYXMgZm9sbG93czoKCjEuIHdhaXRfZG1ldmVudHMgdGhyZWFkCndh
aXRfZG1ldmVudHMKLT5kbWV2ZW50X2xvb3AKICAgIC0+ZG1fZ2V0X2V2ZW50cyAoLT5kbV9pc19t
cGF0aCkKICAgICAgICAtPmRtX3Rhc2tfcnVuCiAgICAgICAgICAgIC0+X29wZW5fY29udHJvbAog
ICAgICAgICAgICAgICAgLT5fb3Blbl9hbmRfYXNzaWduX2NvbnRyb2xfZmQKCjIuIHVldnFsb29w
IHRocmVhZAp1ZXZxbG9vcAotPnVldmVudF9kaXNwYXRjaAogICAgLT5zZXJ2aWNlX3VldnEKICAg
ICAgICAtPmV2X2FkZF9wYXRoCiAgICAgICAgICAgIC0+X19zZXR1cF9tdWx0aXBhdGgKICAgICAg
ICAgICAgICAgIC0+ZG1fZ2V0X2luZm8KICAgICAgICAgICAgICAgICAgICAtPmRtX3Rhc2tfcnVu
CiAgICAgICAgICAgICAgICAgICAgICAgIC0+X29wZW5fY29udHJvbAogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgLT5fb3Blbl9hbmRfYXNzaWduX2NvbnRyb2xfZmQKCkluIHRoZSBsb25nIHJ1
biwgd2UgbWF5IG5lZWQgdG8gcHJvdGVjdCBsaWJkbSBhY2Nlc3Mgd2l0aCBhIHNlcGFyYXRlCmxv
Y2suIEZvciBub3csIHdvcmsgYXJvdW5kIHRoaXMgcGFydGljdWxhciByYWNlIGJ5IGdyYWJiaW5n
IHRoZQp2ZWNzIGxvZyBmb3IgYW4gZW50aXJlIHJvdW5kIG9mIGV2ZW50cyBwcm9jZXNzaW5nLgoK
VGhpcyBpbXBsaWVzIGFsc28gY2hhbmdlcyBpbiB0aGUgZG1ldmVudHMgdGVzdCBjb2RlLCBiZWNh
dXNlIHBvbGwoKQppcyBub3QgY2FsbGVkIGZyb20gZG1ldmVudF9sb29wKCkgYW55IG1vcmUuCgpS
ZXBvcnRlZC1ieTogbGl4aWFva2VuZyA8bGl4aWFva2VuZ0BodWF3ZWkuY29tPgotLS0KIG11bHRp
cGF0aGQvZG1ldmVudHMuYyB8IDMyICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tCiB0
ZXN0cy9kbWV2ZW50cy5jICAgICAgfCAzNSArKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCA0NSBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9tdWx0aXBhdGhkL2RtZXZlbnRzLmMgYi9tdWx0aXBhdGhkL2RtZXZlbnRz
LmMKaW5kZXggYjIzNWRkNC4uYmU3ZTEyMiAxMDA2NDQKLS0tIGEvbXVsdGlwYXRoZC9kbWV2ZW50
cy5jCisrKyBiL211bHRpcGF0aGQvZG1ldmVudHMuYwpAQCAtMjg5LDI0ICsyODksMTUgQEAgc3Rh
dGljIHZvaWQgdW53YXRjaF9kbWV2ZW50cyhjaGFyICpuYW1lKQogc3RhdGljIGludCBkbWV2ZW50
X2xvb3AgKHZvaWQpCiB7CiAJaW50IHIsIGkgPSAwOwotCXN0cnVjdCBwb2xsZmQgcGZkOwogCXN0
cnVjdCBkZXZfZXZlbnQgKmRldl9ldnQ7CiAKLQlwZmQuZmQgPSB3YWl0ZXItPmZkOwotCXBmZC5l
dmVudHMgPSBQT0xMSU47Ci0JciA9IHBvbGwoJnBmZCwgMSwgLTEpOwotCWlmIChyIDw9IDApIHsK
LQkJY29uZGxvZygwLCAiZmFpbGVkIHBvbGxpbmcgZm9yIGRtIGV2ZW50czogJXMiLCBzdHJlcnJv
cihlcnJubykpOwotCQkvKiBzbGVlcCAxcyBhbmQgaG9wZSB0aGluZ3MgZ2V0IGJldHRlciAqLwot
CQlyZXR1cm4gMTsKLQl9Ci0KIAlpZiAoYXJtX2RtX2V2ZW50X3BvbGwod2FpdGVyLT5mZCkgIT0g
MCkgewogCQljb25kbG9nKDAsICJDYW5ub3QgcmUtYXJtIGV2ZW50IHBvbGxpbmc6ICVzIiwgc3Ry
ZXJyb3IoZXJybm8pKTsKIAkJLyogc2xlZXAgMXMgYW5kIGhvcGUgdGhpbmdzIGdldCBiZXR0ZXIg
Ki8KIAkJcmV0dXJuIDE7CiAJfQogCisKIAlpZiAoZG1fZ2V0X2V2ZW50cygpICE9IDApIHsKIAkJ
Y29uZGxvZygwLCAiZmFpbGVkIGdldHRpbmcgZG0gZXZlbnRzOiAlcyIsIHN0cmVycm9yKGVycm5v
KSk7CiAJCS8qIHNsZWVwIDFzIGFuZCBob3BlIHRoaW5ncyBnZXQgYmV0dGVyICovCkBAIC0zNTIs
MTUgKzM0MywxMiBAQCBzdGF0aWMgaW50IGRtZXZlbnRfbG9vcCAodm9pZCkKIAkJICogNCkgYSBw
YXRoIHJlaW5zdGF0ZSA6IG5vdGhpbmcgdG8gZG8KIAkJICogNSkgYSBzd2l0Y2ggZ3JvdXAgOiBu
b3RoaW5nIHRvIGRvCiAJCSAqLwotCQlwdGhyZWFkX2NsZWFudXBfcHVzaChjbGVhbnVwX2xvY2ss
ICZ3YWl0ZXItPnZlY3MtPmxvY2spOwotCQlsb2NrKCZ3YWl0ZXItPnZlY3MtPmxvY2spOwogCQlw
dGhyZWFkX3Rlc3RjYW5jZWwoKTsKIAkJciA9IDA7CiAJCWlmIChjdXJyX2Rldi5hY3Rpb24gPT0g
RVZFTlRfUkVNT1ZFKQogCQkJcmVtb3ZlX21hcF9ieV9hbGlhcyhjdXJyX2Rldi5uYW1lLCB3YWl0
ZXItPnZlY3MsIDEpOwogCQllbHNlCiAJCQlyID0gdXBkYXRlX211bHRpcGF0aCh3YWl0ZXItPnZl
Y3MsIGN1cnJfZGV2Lm5hbWUsIDEpOwotCQlwdGhyZWFkX2NsZWFudXBfcG9wKDEpOwogCiAJCWlm
IChyKSB7CiAJCQljb25kbG9nKDIsICIlczogc3RvcHBlZCB3YXRjaGluZyBkbWV2ZW50cyIsCkBA
IC0zOTIsNyArMzgwLDIzIEBAIHZvaWQgKndhaXRfZG1ldmVudHMgKF9fYXR0cmlidXRlX18oKHVu
dXNlZCkpIHZvaWQgKnVudXNlZCkKIAltbG9ja2FsbChNQ0xfQ1VSUkVOVCB8IE1DTF9GVVRVUkUp
OwogCiAJd2hpbGUgKDEpIHsKLQkJciA9IGRtZXZlbnRfbG9vcCgpOworCQlzdHJ1Y3QgcG9sbGZk
IHBmZDsKKwkJcGZkLmZkID0gd2FpdGVyLT5mZDsKKworCQlwZmQuZXZlbnRzID0gUE9MTElOOwor
CQlyID0gcG9sbCgmcGZkLCAxLCAtMSk7CisKKwkJaWYgKHIgPD0gMCkgeworCQkJY29uZGxvZygw
LCAiZmFpbGVkIHBvbGxpbmcgZm9yIGRtIGV2ZW50czogJXMiLCBzdHJlcnJvcihlcnJubykpOwor
CQkJLyogc2xlZXAgMXMgYW5kIGhvcGUgdGhpbmdzIGdldCBiZXR0ZXIgKi8KKwkJCXIgPSAxOwor
CQl9IGVsc2UgeworCQkJcHRocmVhZF9jbGVhbnVwX3B1c2goY2xlYW51cF9sb2NrLCAmd2FpdGVy
LT52ZWNzLT5sb2NrKTsKKwkJCWxvY2soJndhaXRlci0+dmVjcy0+bG9jayk7CisJCQlwdGhyZWFk
X3Rlc3RjYW5jZWwoKTsKKwkJCXIgPSBkbWV2ZW50X2xvb3AoKTsKKwkJCXB0aHJlYWRfY2xlYW51
cF9wb3AoMSk7CisJCX0KIAogCQlpZiAociA8IDApCiAJCQlicmVhazsKZGlmZiAtLWdpdCBhL3Rl
c3RzL2RtZXZlbnRzLmMgYi90ZXN0cy9kbWV2ZW50cy5jCmluZGV4IGJlZTExN2EuLjY4NTc5NjMg
MTAwNjQ0Ci0tLSBhL3Rlc3RzL2RtZXZlbnRzLmMKKysrIGIvdGVzdHMvZG1ldmVudHMuYwpAQCAt
NjI3LDkgKzYyNyw4IEBAIHN0YXRpYyB2b2lkIHRlc3RfZ2V0X2V2ZW50c19nb29kMSh2b2lkICoq
c3RhdGUpCiAJYXNzZXJ0X2ludF9lcXVhbChWRUNUT1JfU0laRSh3YWl0ZXItPmV2ZW50cyksIDMp
OwogfQogCi0vKiBwb2xsIGRvZXMgbm90IHJldHVybiBhbiBldmVudC4gbm90aGluZyBoYXBwZW5z
LiBUaGUKLSAqIGRldmljZXMgcmVtYWluIGFmdGVyIHRoaXMgdGVzdCAqLwotc3RhdGljIHZvaWQg
dGVzdF9kbWV2ZW50X2xvb3BfYmFkMCh2b2lkICoqc3RhdGUpCisvKiBhcm1fZG1fZXZlbnRfcG9s
bCdzIGlvY3RsIGZhaWxzLiBOb3RoaW5nIGhhcHBlbnMgKi8KK3N0YXRpYyB2b2lkIHRlc3RfZG1l
dmVudF9sb29wX2JhZDEodm9pZCAqKnN0YXRlKQogewogCXN0cnVjdCBkbV9kZXZpY2UgKmRldjsK
IAlzdHJ1Y3QgZGV2X2V2ZW50ICpkZXZfZXZ0OwpAQCAtNjM3LDM0ICs2MzYsMTMgQEAgc3RhdGlj
IHZvaWQgdGVzdF9kbWV2ZW50X2xvb3BfYmFkMCh2b2lkICoqc3RhdGUpCiAJaWYgKGRhdGFwID09
IE5VTEwpCiAJCXNraXAoKTsKIAorCS8vIHdpbGxfcmV0dXJuKF9fd3JhcF9wb2xsLCAxKTsKIAly
ZW1vdmVfYWxsX2RtX2RldmljZV9ldmVudHMoKTsKIAl1bndhdGNoX2FsbF9kbWV2ZW50cygpOwog
CWFzc2VydF9pbnRfZXF1YWwoYWRkX2RtX2RldmljZV9ldmVudCgiZm9vIiwgMSwgNSksIDApOwog
CXdpbGxfcmV0dXJuKF9fd3JhcF9kbV9nZXRldmVudG5yLCAwKTsKIAlhc3NlcnRfaW50X2VxdWFs
KHdhdGNoX2RtZXZlbnRzKCJmb28iKSwgMCk7CiAJYXNzZXJ0X2ludF9lcXVhbChhZGRfZG1fZGV2
aWNlX2V2ZW50KCJmb28iLCAxLCA2KSwgMCk7Ci0Jd2lsbF9yZXR1cm4oX193cmFwX3BvbGwsIDAp
OwotCWFzc2VydF9pbnRfZXF1YWwoZG1ldmVudF9sb29wKCksIDEpOwotCWRldl9ldnQgPSBmaW5k
X2RtZXZlbnRzKCJmb28iKTsKLQlhc3NlcnRfcHRyX25vdF9lcXVhbChkZXZfZXZ0LCBOVUxMKTsK
LQlhc3NlcnRfaW50X2VxdWFsKGRldl9ldnQtPmV2dF9uciwgNSk7Ci0JYXNzZXJ0X2ludF9lcXVh
bChkZXZfZXZ0LT5hY3Rpb24sIEVWRU5UX05PVEhJTkcpOwotCWRldiA9IGZpbmRfZG1fZGV2aWNl
KCJmb28iKTsKLQlhc3NlcnRfcHRyX25vdF9lcXVhbChkZXYsIE5VTEwpOwotCWFzc2VydF9pbnRf
ZXF1YWwoZGV2LT5ldnRfbnIsIDYpOwotCWFzc2VydF9pbnRfZXF1YWwoZGV2LT51cGRhdGVfbnIs
IDUpOwotfQotCi0vKiBhcm1fZG1fZXZlbnRfcG9sbCdzIGlvY3RsIGZhaWxzLiBOb3RoaW5nIGhh
cHBlbnMgKi8KLXN0YXRpYyB2b2lkIHRlc3RfZG1ldmVudF9sb29wX2JhZDEodm9pZCAqKnN0YXRl
KQotewotCXN0cnVjdCBkbV9kZXZpY2UgKmRldjsKLQlzdHJ1Y3QgZGV2X2V2ZW50ICpkZXZfZXZ0
OwotCXN0cnVjdCB0ZXN0X2RhdGEgKmRhdGFwID0gKHN0cnVjdCB0ZXN0X2RhdGEgKikoKnN0YXRl
KTsKLQlpZiAoZGF0YXAgPT0gTlVMTCkKLQkJc2tpcCgpOwotCi0Jd2lsbF9yZXR1cm4oX193cmFw
X3BvbGwsIDEpOwogCXdpbGxfcmV0dXJuKF9fd3JhcF9pb2N0bCwgLTEpOwogCWFzc2VydF9pbnRf
ZXF1YWwoZG1ldmVudF9sb29wKCksIDEpOwogCWRldl9ldnQgPSBmaW5kX2RtZXZlbnRzKCJmb28i
KTsKQEAgLTY4Niw3ICs2NjQsNyBAQCBzdGF0aWMgdm9pZCB0ZXN0X2RtZXZlbnRfbG9vcF9iYWQy
KHZvaWQgKipzdGF0ZSkKIAlpZiAoZGF0YXAgPT0gTlVMTCkKIAkJc2tpcCgpOwogCi0Jd2lsbF9y
ZXR1cm4oX193cmFwX3BvbGwsIDEpOworCS8vIHdpbGxfcmV0dXJuKF9fd3JhcF9wb2xsLCAxKTsK
IAl3aWxsX3JldHVybihfX3dyYXBfaW9jdGwsIDApOwogCXdpbGxfcmV0dXJuKF9fd3JhcF9saWJt
cF9kbV90YXNrX2NyZWF0ZSwgTlVMTCk7CiAJYXNzZXJ0X2ludF9lcXVhbChkbWV2ZW50X2xvb3Ao
KSwgMSk7CkBAIC03MTAsNyArNjg4LDYgQEAgc3RhdGljIHZvaWQgdGVzdF9kbWV2ZW50X2xvb3Bf
Z29vZDAodm9pZCAqKnN0YXRlKQogCiAJcmVtb3ZlX2FsbF9kbV9kZXZpY2VfZXZlbnRzKCk7CiAJ
dW53YXRjaF9hbGxfZG1ldmVudHMoKTsKLQl3aWxsX3JldHVybihfX3dyYXBfcG9sbCwgMSk7CiAJ
d2lsbF9yZXR1cm4oX193cmFwX2lvY3RsLCAwKTsKIAl3aWxsX3JldHVybihfX3dyYXBfbGlibXBf
ZG1fdGFza19jcmVhdGUsICZkYXRhKTsKIAl3aWxsX3JldHVybihfX3dyYXBfZG1fdGFza19ub19v
cGVuX2NvdW50LCAxKTsKQEAgLTc0Niw3ICs3MjMsNiBAQCBzdGF0aWMgdm9pZCB0ZXN0X2RtZXZl
bnRfbG9vcF9nb29kMSh2b2lkICoqc3RhdGUpCiAJYXNzZXJ0X2ludF9lcXVhbCh3YXRjaF9kbWV2
ZW50cygieHl6enkiKSwgMCk7CiAJYXNzZXJ0X2ludF9lcXVhbChhZGRfZG1fZGV2aWNlX2V2ZW50
KCJmb28iLCAxLCA2KSwgMCk7CiAJYXNzZXJ0X2ludF9lcXVhbChyZW1vdmVfZG1fZGV2aWNlX2V2
ZW50KCJ4eXp6eSIpLCAwKTsKLQl3aWxsX3JldHVybihfX3dyYXBfcG9sbCwgMSk7CiAJd2lsbF9y
ZXR1cm4oX193cmFwX2lvY3RsLCAwKTsKIAl3aWxsX3JldHVybihfX3dyYXBfbGlibXBfZG1fdGFz
a19jcmVhdGUsICZkYXRhKTsKIAl3aWxsX3JldHVybihfX3dyYXBfZG1fdGFza19ub19vcGVuX2Nv
dW50LCAxKTsKQEAgLTc5NCw3ICs3NzAsNiBAQCBzdGF0aWMgdm9pZCB0ZXN0X2RtZXZlbnRfbG9v
cF9nb29kMih2b2lkICoqc3RhdGUpCiAJd2lsbF9yZXR1cm4oX193cmFwX2RtX2dldGV2ZW50bnIs
IDApOwogCWFzc2VydF9pbnRfZXF1YWwod2F0Y2hfZG1ldmVudHMoImJheiIpLCAwKTsKIAlhc3Nl
cnRfaW50X2VxdWFsKGFkZF9kbV9kZXZpY2VfZXZlbnQoImJheiIsIDEsIDE0KSwgMCk7Ci0Jd2ls
bF9yZXR1cm4oX193cmFwX3BvbGwsIDEpOwogCXdpbGxfcmV0dXJuKF9fd3JhcF9pb2N0bCwgMCk7
CiAJd2lsbF9yZXR1cm4oX193cmFwX2xpYm1wX2RtX3Rhc2tfY3JlYXRlLCAmZGF0YSk7CiAJd2ls
bF9yZXR1cm4oX193cmFwX2RtX3Rhc2tfbm9fb3Blbl9jb3VudCwgMSk7CkBAIC04MzgsNyArODEz
LDYgQEAgc3RhdGljIHZvaWQgdGVzdF9kbWV2ZW50X2xvb3BfZ29vZDModm9pZCAqKnN0YXRlKQog
CiAJYXNzZXJ0X2ludF9lcXVhbChyZW1vdmVfZG1fZGV2aWNlX2V2ZW50KCJmb28iKSwgMCk7CiAJ
dW53YXRjaF9kbWV2ZW50cygiYmFyIik7Ci0Jd2lsbF9yZXR1cm4oX193cmFwX3BvbGwsIDEpOwog
CXdpbGxfcmV0dXJuKF9fd3JhcF9pb2N0bCwgMCk7CiAJd2lsbF9yZXR1cm4oX193cmFwX2xpYm1w
X2RtX3Rhc2tfY3JlYXRlLCAmZGF0YSk7CiAJd2lsbF9yZXR1cm4oX193cmFwX2RtX3Rhc2tfbm9f
b3Blbl9jb3VudCwgMSk7CkBAIC04OTYsNyArODcwLDYgQEAgaW50IHRlc3RfZG1ldmVudHModm9p
ZCkKIAkJY21vY2thX3VuaXRfdGVzdCh0ZXN0X2dldF9ldmVudHNfZ29vZDApLAogCQljbW9ja2Ff
dW5pdF90ZXN0KHRlc3RfZ2V0X2V2ZW50c19nb29kMSksCiAJCWNtb2NrYV91bml0X3Rlc3QodGVz
dF9hcm1fcG9sbCksCi0JCWNtb2NrYV91bml0X3Rlc3QodGVzdF9kbWV2ZW50X2xvb3BfYmFkMCks
CiAJCWNtb2NrYV91bml0X3Rlc3QodGVzdF9kbWV2ZW50X2xvb3BfYmFkMSksCiAJCWNtb2NrYV91
bml0X3Rlc3QodGVzdF9kbWV2ZW50X2xvb3BfYmFkMiksCiAJCWNtb2NrYV91bml0X3Rlc3QodGVz
dF9kbWV2ZW50X2xvb3BfZ29vZDApLAotLSAKMi4yNi4yCgo=
--=-eq+tH20cBVmKS7V2ypKB
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--=-eq+tH20cBVmKS7V2ypKB--

