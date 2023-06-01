Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0639D71F11F
	for <lists+dm-devel@lfdr.de>; Thu,  1 Jun 2023 19:52:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685641957;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DuTj3pIKVDHE98LkqTErOVBuDaMIQ7GCnDjM9sYsra0=;
	b=MTvbU9+TovxcaqXsDITkFHcPoBAisdQ6+OUbyGiS08PmZ02dofcb1u7xhHhkBeedqeVKdH
	5d+JTSXuxNR9q4pfvvqXm//c5CKPFMIqkSVKx1R76YQ/NUI52p8gAT7tZkaV/75cLtvQBe
	a30SLXtiGQTHmz8ZDmD3KZt9aAexGtQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-487-zHkxEYlCMguB_cDFevuoLg-1; Thu, 01 Jun 2023 13:52:35 -0400
X-MC-Unique: zHkxEYlCMguB_cDFevuoLg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0EF313C17C6D;
	Thu,  1 Jun 2023 17:52:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A8D912029F6D;
	Thu,  1 Jun 2023 17:52:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 731F319465B5;
	Thu,  1 Jun 2023 17:52:30 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0EF73194658C
 for <dm-devel@listman.corp.redhat.com>; Thu,  1 Jun 2023 17:52:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 238319E71; Thu,  1 Jun 2023 17:52:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BDBCC8162;
 Thu,  1 Jun 2023 17:52:01 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 351HpxIo023786;
 Thu, 1 Jun 2023 12:51:59 -0500
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 351HpxTB023785;
 Thu, 1 Jun 2023 12:51:59 -0500
Date: Thu, 1 Jun 2023 12:51:58 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Message-ID: <20230601175158.GN24096@octiron.msp.redhat.com>
References: <1684537332-23033-1-git-send-email-bmarzins@redhat.com>
 <1684537332-23033-5-git-send-email-bmarzins@redhat.com>
 <8ae8ff6b0d7d02d33da5b894c3ff1b0e4cdd8a9e.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <8ae8ff6b0d7d02d33da5b894c3ff1b0e4cdd8a9e.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [dm-devel] [PATCH 4/5] multipath-tools tests: add tests for
 group_by_tpg policy
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
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Wed, May 31, 2023 at 03:30:02PM +0000, Martin Wilck wrote:
> On Fri, 2023-05-19 at 18:02 -0500, Benjamin Marzinski wrote:
> > Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
>=20
> I wonder if it might make sense for group_by_tpg to mock calls to
> getprio (assigning the prio from the path's TPG ID) rather than calling
> set_priority() directly.

It seems like it should be. I just continued with what the existing tests w=
ere
already doing. Can improving these tests happen outside of this patchset?

-Ben

>=20
>=20
> > ---
> > =A0tests/pgpolicy.c | 201
> > +++++++++++++++++++++++++++++++++++++++++++++++
> > =A01 file changed, 201 insertions(+)
> >=20
> > diff --git a/tests/pgpolicy.c b/tests/pgpolicy.c
> > index 43be831f..85fa30ce 100644
> > --- a/tests/pgpolicy.c
> > +++ b/tests/pgpolicy.c
> > @@ -32,6 +32,15 @@ struct multipath mp8, mp4, mp1, mp0, mp_null;
> > =A0struct path p8[8], p4[4], p1[1];
> > =A0
> > =A0
> > +static void set_tpg(struct path *pp, int *tpg, int size)
> > +{
> > +=A0=A0=A0=A0=A0=A0=A0int i;
> > +
> > +=A0=A0=A0=A0=A0=A0=A0for (i =3D 0; i < size; i++) {
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0pp[i].tpg_id =3D tpg[i];
> > +=A0=A0=A0=A0=A0=A0=A0}
> > +}
> > +
> > =A0static void set_priority(struct path *pp, int *prio, int size)
> > =A0{
> > =A0=A0=A0=A0=A0=A0=A0=A0int i;
> > @@ -639,6 +648,187 @@ static void
> > test_group_by_prio_mixed_one_marginal8(void **state)
> > =A0=A0=A0=A0=A0=A0=A0=A0verify_pathgroups(&mp8, p8, groups, group_size,
> > group_marginal, 7);
> > =A0}
> > =A0
> > +static void test_group_by_tpg_same8(void **state)
> > +{
> > +=A0=A0=A0=A0=A0=A0=A0int paths[] =3D {0,1,2,3,4,5,6,7};
> > +=A0=A0=A0=A0=A0=A0=A0int *groups[] =3D {paths};
> > +=A0=A0=A0=A0=A0=A0=A0int group_size[] =3D {8};
> > +
> > +=A0=A0=A0=A0=A0=A0=A0mp8.pgpolicyfn =3D group_by_tpg;
> > +=A0=A0=A0=A0=A0=A0=A0assert_int_equal(group_paths(&mp8, 0), 0);
> > +=A0=A0=A0=A0=A0=A0=A0verify_pathgroups(&mp8, p8, groups, group_size, N=
ULL, 1);
> > +}
> > +
> > +static void test_group_by_tpg_different8(void **state)
> > +{
> > +=A0=A0=A0=A0=A0=A0=A0int prio[] =3D {1,2,3,4,5,6,7,8};
> > +=A0=A0=A0=A0=A0=A0=A0int tpg[] =3D {3,5,4,1,8,6,7,2};
> > +=A0=A0=A0=A0=A0=A0=A0int paths[] =3D {7,6,5,4,3,2,1,0};
> > +=A0=A0=A0=A0=A0=A0=A0int *groups[] =3D {&paths[0], &paths[1], &paths[2=
], &paths[3],
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 &paths[4], &paths[5], &paths[6],
> > &paths[7]};
> > +=A0=A0=A0=A0=A0=A0=A0int group_size[] =3D {1,1,1,1,1,1,1,1};
> > +
> > +=A0=A0=A0=A0=A0=A0=A0set_priority(p8, prio, 8);
> > +=A0=A0=A0=A0=A0=A0=A0set_tpg(p8, tpg, 8);
> > +=A0=A0=A0=A0=A0=A0=A0mp8.pgpolicyfn =3D group_by_tpg;
> > +=A0=A0=A0=A0=A0=A0=A0assert_int_equal(group_paths(&mp8, 0), 0);
> > +=A0=A0=A0=A0=A0=A0=A0verify_pathgroups(&mp8, p8, groups, group_size, N=
ULL, 8);
> > +}
> > +
> > +static void test_group_by_tpg_mixed8(void **state)
> > +{
> > +=A0=A0=A0=A0=A0=A0=A0int prio[] =3D {7,2,3,3,5,2,8,2};
> > +=A0=A0=A0=A0=A0=A0=A0int tpg[] =3D {1,2,3,3,4,2,5,6};
> > +=A0=A0=A0=A0=A0=A0=A0int group0[] =3D {6};
> > +=A0=A0=A0=A0=A0=A0=A0int group1[] =3D {0};
> > +=A0=A0=A0=A0=A0=A0=A0int group2[] =3D {4};
> > +=A0=A0=A0=A0=A0=A0=A0int group3[] =3D {2,3};
> > +=A0=A0=A0=A0=A0=A0=A0int group4[] =3D {1,5};
> > +=A0=A0=A0=A0=A0=A0=A0int group5[] =3D {7};
> > +=A0=A0=A0=A0=A0=A0=A0int *groups[] =3D {group0, group1, group2, group3=
,
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 group4, group5};
> > +=A0=A0=A0=A0=A0=A0=A0int group_size[] =3D {1,1,1,2,2,1};
> > +
> > +=A0=A0=A0=A0=A0=A0=A0set_priority(p8, prio, 8);
> > +=A0=A0=A0=A0=A0=A0=A0set_tpg(p8, tpg, 8);
> > +=A0=A0=A0=A0=A0=A0=A0mp8.pgpolicyfn =3D group_by_tpg;
> > +=A0=A0=A0=A0=A0=A0=A0assert_int_equal(group_paths(&mp8, 0), 0);
> > +=A0=A0=A0=A0=A0=A0=A0verify_pathgroups(&mp8, p8, groups, group_size, N=
ULL, 6);
> > +}
> > +
> > +static void test_group_by_tpg_3_groups8(void **state)
> > +{
> > +=A0=A0=A0=A0=A0=A0=A0int prio[] =3D {1,2,2,1,2,1,1,2};
> > +=A0=A0=A0=A0=A0=A0=A0int tpg[] =3D {1,2,2,1,3,1,1,3};
> > +=A0=A0=A0=A0=A0=A0=A0int group0[] =3D {1,2};
> > +=A0=A0=A0=A0=A0=A0=A0int group1[] =3D {4,7};
> > +=A0=A0=A0=A0=A0=A0=A0int group2[] =3D {0,3,5,6};
> > +=A0=A0=A0=A0=A0=A0=A0int *groups[] =3D {group0, group1, group2};
> > +=A0=A0=A0=A0=A0=A0=A0int group_size[] =3D {2,2,4};
> > +
> > +=A0=A0=A0=A0=A0=A0=A0set_priority(p8, prio, 8);
> > +=A0=A0=A0=A0=A0=A0=A0set_tpg(p8, tpg, 8);
> > +=A0=A0=A0=A0=A0=A0=A0mp8.pgpolicyfn =3D group_by_tpg;
> > +=A0=A0=A0=A0=A0=A0=A0assert_int_equal(group_paths(&mp8, 0), 0);
> > +=A0=A0=A0=A0=A0=A0=A0verify_pathgroups(&mp8, p8, groups, group_size, N=
ULL, 3);
> > +}
> > +
> > +static void test_group_by_tpg_2_groups4(void **state)
> > +{
> > +=A0=A0=A0=A0=A0=A0=A0int prio[] =3D {2,1,1,2};
> > +=A0=A0=A0=A0=A0=A0=A0int tpg[] =3D {1,2,2,1};
> > +=A0=A0=A0=A0=A0=A0=A0int group0[] =3D {0,3};
> > +=A0=A0=A0=A0=A0=A0=A0int group1[] =3D {1,2};
> > +=A0=A0=A0=A0=A0=A0=A0int *groups[] =3D {group0, group1};
> > +=A0=A0=A0=A0=A0=A0=A0int group_size[] =3D {2,2};
> > +
> > +=A0=A0=A0=A0=A0=A0=A0set_priority(p4, prio, 4);
> > +=A0=A0=A0=A0=A0=A0=A0set_tpg(p4, tpg, 4);
> > +=A0=A0=A0=A0=A0=A0=A0mp4.pgpolicyfn =3D group_by_tpg;
> > +=A0=A0=A0=A0=A0=A0=A0assert_int_equal(group_paths(&mp4, 0), 0);
> > +=A0=A0=A0=A0=A0=A0=A0verify_pathgroups(&mp4, p4, groups, group_size, N=
ULL, 2);
> > +}
> > +
> > +static void test_group_by_tpg1(void **state)
> > +{
> > +=A0=A0=A0=A0=A0=A0=A0int paths[] =3D {0};
> > +=A0=A0=A0=A0=A0=A0=A0int *groups[] =3D {paths};
> > +=A0=A0=A0=A0=A0=A0=A0int group_size[] =3D {1};
> > +
> > +=A0=A0=A0=A0=A0=A0=A0mp1.pgpolicyfn =3D group_by_tpg;
> > +=A0=A0=A0=A0=A0=A0=A0assert_int_equal(group_paths(&mp1, 0), 0);
> > +=A0=A0=A0=A0=A0=A0=A0verify_pathgroups(&mp1, p1, groups, group_size, N=
ULL, 1);
> > +}
> > +
> > +static void test_group_by_tpg0(void **state)
> > +{
> > +=A0=A0=A0=A0=A0=A0=A0mp0.pgpolicyfn =3D group_by_tpg;
> > +=A0=A0=A0=A0=A0=A0=A0assert_int_equal(group_paths(&mp0, 0), 0);
> > +=A0=A0=A0=A0=A0=A0=A0verify_pathgroups(&mp0, NULL, NULL, NULL, NULL, 0=
);
> > +}
> > +
> > +static void test_group_by_tpg_null(void **state)
> > +{
> > +=A0=A0=A0=A0=A0=A0=A0mp_null.pgpolicyfn =3D group_by_tpg;
> > +=A0=A0=A0=A0=A0=A0=A0assert_int_equal(group_paths(&mp_null, 0), 0);
> > +=A0=A0=A0=A0=A0=A0=A0verify_pathgroups(&mp_null, NULL, NULL, NULL, NUL=
L, 0);
> > +}
> > +
> > +static void test_group_by_tpg_mixed_all_marginal8(void **state)
> > +{
> > +=A0=A0=A0=A0=A0=A0=A0int prio[] =3D {7,2,3,3,5,2,8,2};
> > +=A0=A0=A0=A0=A0=A0=A0int tpg[] =3D {1,2,3,3,4,2,5,6};
> > +=A0=A0=A0=A0=A0=A0=A0int marginal[] =3D {1,1,1,1,1,1,1,1};
> > +=A0=A0=A0=A0=A0=A0=A0int group0[] =3D {6};
> > +=A0=A0=A0=A0=A0=A0=A0int group1[] =3D {0};
> > +=A0=A0=A0=A0=A0=A0=A0int group2[] =3D {4};
> > +=A0=A0=A0=A0=A0=A0=A0int group3[] =3D {2,3};
> > +=A0=A0=A0=A0=A0=A0=A0int group4[] =3D {1,5};
> > +=A0=A0=A0=A0=A0=A0=A0int group5[] =3D {7};
> > +=A0=A0=A0=A0=A0=A0=A0int *groups[] =3D {group0, group1, group2, group3=
,
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 group4, group5};
> > +=A0=A0=A0=A0=A0=A0=A0int group_size[] =3D {1,1,1,2,2,1};
> > +=A0=A0=A0=A0=A0=A0=A0int group_marginal[] =3D {1,1,1,1,1,1};
> > +
> > +=A0=A0=A0=A0=A0=A0=A0set_priority(p8, prio, 8);
> > +=A0=A0=A0=A0=A0=A0=A0set_tpg(p8, tpg, 8);
> > +=A0=A0=A0=A0=A0=A0=A0set_marginal(p8, marginal, 8);
> > +=A0=A0=A0=A0=A0=A0=A0mp8.pgpolicyfn =3D group_by_tpg;
> > +=A0=A0=A0=A0=A0=A0=A0assert_int_equal(group_paths(&mp8, 1), 0);
> > +=A0=A0=A0=A0=A0=A0=A0verify_pathgroups(&mp8, p8, groups, group_size,
> > group_marginal, 6);
> > +}
> > +
> > +static void test_group_by_tpg_mixed_half_marginal8(void **state)
> > +{
> > +=A0=A0=A0=A0=A0=A0=A0int prio[] =3D {7,1,3,3,3,2,8,2};
> > +=A0=A0=A0=A0=A0=A0=A0int tpg[] =3D {1,2,3,4,5,6,7,6};
> > +=A0=A0=A0=A0=A0=A0=A0int marginal[] =3D {0,0,0,1,0,1,1,1};
> > +=A0=A0=A0=A0=A0=A0=A0int group0[] =3D {0};
> > +=A0=A0=A0=A0=A0=A0=A0int group1[] =3D {2};
> > +=A0=A0=A0=A0=A0=A0=A0int group2[] =3D {4};
> > +=A0=A0=A0=A0=A0=A0=A0int group3[] =3D {1};
> > +=A0=A0=A0=A0=A0=A0=A0int group4[] =3D {6};
> > +=A0=A0=A0=A0=A0=A0=A0int group5[] =3D {3};
> > +=A0=A0=A0=A0=A0=A0=A0int group6[] =3D {5,7};
> > +=A0=A0=A0=A0=A0=A0=A0int *groups[] =3D {group0, group1, group2, group3=
,
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 group4, group5, group6};
> > +=A0=A0=A0=A0=A0=A0=A0int group_size[] =3D {1,1,1,1,1,1,2};
> > +=A0=A0=A0=A0=A0=A0=A0int group_marginal[] =3D {0,0,0,0,1,1,1};
> > +
> > +=A0=A0=A0=A0=A0=A0=A0set_priority(p8, prio, 8);
> > +=A0=A0=A0=A0=A0=A0=A0set_tpg(p8, tpg, 8);
> > +=A0=A0=A0=A0=A0=A0=A0set_marginal(p8, marginal, 8);
> > +=A0=A0=A0=A0=A0=A0=A0mp8.pgpolicyfn =3D group_by_tpg;
> > +=A0=A0=A0=A0=A0=A0=A0assert_int_equal(group_paths(&mp8, 1), 0);
> > +=A0=A0=A0=A0=A0=A0=A0verify_pathgroups(&mp8, p8, groups, group_size,
> > group_marginal, 7);
> > +}
> > +
> > +static void test_group_by_tpg_mixed_one_marginal8(void **state)
> > +{
> > +=A0=A0=A0=A0=A0=A0=A0int prio[] =3D {7,1,3,3,5,2,8,2};
> > +=A0=A0=A0=A0=A0=A0=A0int tpg[]=A0 =3D {1,2,3,3,4,5,6,5};
> > +=A0=A0=A0=A0=A0=A0=A0int marginal[] =3D {0,0,0,0,0,1,0,0};
> > +=A0=A0=A0=A0=A0=A0=A0int group0[] =3D {6};
> > +=A0=A0=A0=A0=A0=A0=A0int group1[] =3D {0};
> > +=A0=A0=A0=A0=A0=A0=A0int group2[] =3D {4};
> > +=A0=A0=A0=A0=A0=A0=A0int group3[] =3D {2,3};
> > +=A0=A0=A0=A0=A0=A0=A0int group4[] =3D {7};
> > +=A0=A0=A0=A0=A0=A0=A0int group5[] =3D {1};
> > +=A0=A0=A0=A0=A0=A0=A0int group6[] =3D {5};
> > +=A0=A0=A0=A0=A0=A0=A0int *groups[] =3D {group0, group1, group2, group3=
,
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 group4, group5, group6};
> > +=A0=A0=A0=A0=A0=A0=A0int group_size[] =3D {1,1,1,2,1,1,1};
> > +=A0=A0=A0=A0=A0=A0=A0int group_marginal[] =3D {0,0,0,0,0,0,1};
> > +
> > +=A0=A0=A0=A0=A0=A0=A0set_priority(p8, prio, 8);
> > +=A0=A0=A0=A0=A0=A0=A0set_tpg(p8, tpg, 8);
> > +=A0=A0=A0=A0=A0=A0=A0set_marginal(p8, marginal, 8);
> > +=A0=A0=A0=A0=A0=A0=A0mp8.pgpolicyfn =3D group_by_tpg;
> > +=A0=A0=A0=A0=A0=A0=A0assert_int_equal(group_paths(&mp8, 1), 0);
> > +=A0=A0=A0=A0=A0=A0=A0verify_pathgroups(&mp8, p8, groups, group_size,
> > group_marginal, 7);
> > +}
> > +
> > +
> > =A0static void test_group_by_node_name_same8(void **state)
> > =A0{
> > =A0=A0=A0=A0=A0=A0=A0=A0char *node_name[] =3D {"a","a","a","a","a","a",=
"a","a"};
> > @@ -1002,6 +1192,17 @@ int test_pgpolicies(void)
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0setup_test(test_group_b=
y_prio_mixed_all_marginal, 8),
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0setup_test(test_group_b=
y_prio_mixed_half_marginal,
> > 8),
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0setup_test(test_group_b=
y_prio_mixed_one_marginal, 8),
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0setup_test(test_group_by_=
tpg_same, 8),
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0setup_test(test_group_by_=
tpg_different, 8),
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0setup_test(test_group_by_=
tpg_mixed, 8),
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0setup_test(test_group_by_=
tpg_3_groups, 8),
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0setup_test(test_group_by_=
tpg_2_groups, 4),
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0setup_test(test_group_by_=
tpg, 1),
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0setup_test(test_group_by_=
tpg, 0),
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0setup_test(test_group_by_=
tpg, _null),
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0setup_test(test_group_by_=
tpg_mixed_all_marginal, 8),
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0setup_test(test_group_by_=
tpg_mixed_half_marginal, 8),
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0setup_test(test_group_by_=
tpg_mixed_one_marginal, 8),
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0setup_test(test_group_b=
y_node_name_same, 8),
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0setup_test(test_group_b=
y_node_name_increasing, 8),
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0setup_test(test_group_b=
y_node_name_3_groups, 8),
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

